--!/usr/bin/lua

local M = {}

local quit = false

local function open_win()
  vim.cmd('tabnew')
  vim.cmd('set buftype=nofile')

  vim.api.nvim_buf_set_lines(0, 1, -1, false, {
    '                     ----------------------              '
  })
end


local function insert_box()
  
end

function M.start()
  open_win()
  while quit do
    --body
  end
end


return M
