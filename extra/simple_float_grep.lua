local function open_win()
  -- 窗口位置
  -- 宽度： columns 的 80%
  local screen_width = math.floor(vim.o.columns * 0.8)
  -- 起始位位置： lines * 10%, columns * 10%
  local start_col = math.floor(vim.o.columns * 0.1)
  local start_row = math.floor(vim.o.lines * 0.1)
  -- 整体高度：lines 的 80%
  local screen_height = math.floor(vim.o.lines * 0.8)

  local job = require('spacevim.api.job')

  local search_jobid = -1

  local prompt_bufid = vim.api.nvim_create_buf(false, true)
  local prompt_winid = vim.api.nvim_open_win(prompt_bufid, true, {
    relative = 'editor',
    width = screen_width,
    height = 1,
    col = start_col,
    row = start_row + screen_height - 3,
    focusable = true,
    border = 'rounded',
    title = 'Input',
    title_pos = 'center',
    -- noautocmd = true,
  })

  local result_bufid = vim.api.nvim_create_buf(false, true)
  local result_winid = vim.api.nvim_open_win(result_bufid, false, {
    relative = 'editor',
    width = screen_width,
    height = screen_height - 5,
    col = start_col,
    row = start_row,
    focusable = false,
    border = 'rounded',
    title = 'Result',
    title_pos = 'center',
    -- noautocmd = true,
  })
  local cmp = require('cmp')
  if cmp then
    cmp.setup.buffer({
      completion = {
        autocomplete = false,
      },
    })
  end
  vim.cmd('noautocmd startinsert')

  local augroup = vim.api.nvim_create_augroup('floatgrep', {
    clear = true,
  })

  local search_hi_id = 1

  vim.api.nvim_create_autocmd({ 'TextChangedI' }, {
    group = augroup,
    buffer = prompt_bufid,
    callback = function(ev)
      local text = vim.api.nvim_buf_get_lines(prompt_bufid, 0, 1, false)[1]
      if text ~= '' then
        pcall(vim.fn.matchdelete, search_hi_id, result_winid)
        search_hi_id = vim.fn.matchadd(
          'Search',
          [[\<]] .. text .. [[\>]],
          10,
          -1,
          { window = result_winid }
        )
        local grep_cmd = {
          'rg',
          '--no-heading',
          '--color=never',
          '--with-filename',
          '--line-number',
          '--column',
          '-g',
          '!.git',
          '-e',
          text,
          '.',
        }

        vim.api.nvim_buf_set_lines(result_bufid, 0, -1, false, {})
        job.stop(search_jobid)
        search_jobid = job.start(grep_cmd, {
          on_stdout = function(id, data)
            if id == search_jobid then
              if vim.fn.getbufline(result_bufid, 1)[1] == '' then
                vim.api.nvim_buf_set_lines(result_bufid, 0, -1, false, data)
              else
                vim.api.nvim_buf_set_lines(result_bufid, -1, -1, false, data)
              end
            end
          end,
        })
      else
        vim.api.nvim_buf_set_lines(result_bufid, 0, -1, false, {})
      end
    end,
  })

  -- 使用 Esc 关闭整个界面
  vim.keymap.set('i', '<Esc>', function()
    vim.cmd('noautocmd stopinsert')
    vim.api.nvim_win_close(prompt_winid, true)
    vim.api.nvim_win_close(result_winid, true)
  end, { buffer = prompt_bufid })

  -- 搜索结果行转换成文件名、光标位置
  local function get_file_pos(line)
    local filename = vim.fn.fnameescape(vim.fn.split(line, [[:\d\+:]])[1])
    local linenr =
      vim.fn.str2nr(string.sub(vim.fn.matchstr(line, [[:\d\+:]]), 2, -2))
    local colum = vim.fn.str2nr(
      string.sub(vim.fn.matchstr(line, [[\(:\d\+\)\@<=:\d\+:]]), 2, -2)
    )
    return filename, linenr, colum
  end
  -- 使用回车键打开光标所在的搜索结果，同时关闭界面
  vim.keymap.set('i', '<Enter>', function()
    vim.cmd('noautocmd stopinsert')
    -- 获取搜索结果光表行
    local line_number = vim.api.nvim_win_get_cursor(result_winid)[1]
    local filename, linenr, colum = get_file_pos(
      vim.api.nvim_buf_get_lines(
        result_bufid,
        line_number - 1,
        line_number,
        false
      )[1]
    )
    vim.api.nvim_win_close(prompt_winid, true)
    vim.api.nvim_win_close(result_winid, true)
    vim.cmd('edit ' .. filename)
    vim.api.nvim_win_set_cursor(0, { linenr, colum })
  end, { buffer = prompt_bufid })

  -- 使用 Tab/Shift-Tab 上下移动搜素结果
  vim.keymap.set('i', '<Tab>', function()
    local line_number = vim.api.nvim_win_get_cursor(result_winid)[1]
    pcall(vim.api.nvim_win_set_cursor, result_winid, { line_number + 1, 0 })
  end, { buffer = prompt_bufid })

  vim.keymap.set('i', '<S-Tab>', function()
    local line_number = vim.api.nvim_win_get_cursor(result_winid)[1]
    pcall(vim.api.nvim_win_set_cursor, result_winid, { line_number - 1, 0 })
  end, { buffer = prompt_bufid })
  -- 高亮文件名及位置

  vim.fn.matchadd(
    'Comment',
    [[\([A-Z]:\)\?[^:]*:\d\+:\(\d\+:\)\?]],
    11,
    -1,
    { window = result_winid }
  )
end

vim.keymap.set('n', '<C-p>', open_win)
