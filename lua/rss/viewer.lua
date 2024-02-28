local M = {}

local bufnr = -1
local winid = -1

local fd = require('rss.feed')


local function update_context()
  local text = {'RSS list:'}

  for _, v in ipairs(fd.list()) do
  end
  vim.api.nvim_buf_set_option(bufnr, 'modifiable', true)
  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, text)
  vim.api.nvim_buf_set_option(bufnr, 'modifiable', false)
end


function M.open_win()
  if bufnr ~= -1 and vim.api.nvim_buf_is_valid(bufnr) then
    vim.api.nvim_buf_delete(bufnr, {
      force = true,
      unload = false,
    })
  end
  vim.api.nvim_command('topleft vsplit __rss_viwer__')
  local lines = vim.o.columns * 30 / 100
  vim.api.nvim_command('vertical resize ' .. tostring(lines))
  vim.api.nvim_command(
    'setlocal buftype=nofile bufhidden=wipe nobuflisted nolist noswapfile nowrap cursorline nospell nonu norelativenumber winfixheight nomodifiable  winfixwidth'
  )
  vim.api.nvim_command('set filetype=RSSViewer')
  bufnr = vim.api.nvim_get_current_buf()
  update_context()
end


return M
