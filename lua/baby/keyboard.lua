--!/usr/bin/lua

local M = {}

local bufnr = -1
local winnr = -1

local function insert_box(w)
  local box_top = "+--------------------------------------+"
  local box_m = "|                                      |"
  local box_root = "+--------------------------------------+"

  return { box_top, box_m, box_root }
end

local function open_win()
  if not vim.api.nvim_buf_is_valid(bufnr) then
    bufnr = vim.api.nvim_create_buf(false, true)
  end
  local win =  vim.api.nvim_open_win(bufnr, false, {
    relative = "editor",
    width = vim.o.columns - 20,
    height = 10,
    row = 10,
    col = 10,
    focusable = false,
    border = "single",
  })
  vim.fn.setbufvar(bufnr, '&number', 0)
  vim.fn.setbufvar(bufnr, '&relativenumber', 0)
  vim.fn.setbufvar(bufnr, '&cursorline', 0)
  vim.fn.setbufvar(bufnr, '&bufhidden', 'wipe')
  return win
end

function M.start()
  winnr = open_win()
  vim.cmd.redraw()
  local char
  local orgtext = 'The next error mapping and the error transient state can be used to browse errors from syntax checkers'
  local context = ""
  local wait_for_input = true
  while wait_for_input do
    char = vim.fn.getchar()
    if char == 27 then
      wait_for_input = false
    end

    context = context .. vim.fn.nr2char(char)

    vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { orgtext, context })

    vim.cmd.redraw()
    --body
  end
  if vim.api.nvim_win_is_valid(winnr) then
    vim.api.nvim_win_close(winnr, true)
  end
end

return M
