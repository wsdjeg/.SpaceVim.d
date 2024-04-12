--!/usr/bin/lua

local M = {}

local wait_for_input = true
local bufnr = -1
local winnr = -1

local function insert_box(w)
	local box_top = "+--------------------------------------+"
	local box_m = "|                                      |"
	local box_root = "+--------------------------------------+"

	return { box_top, box_m, box_root }
end

local function open_win()
  if vim.api.nvim_buf_is_valid(bufnr) then
    bufnr = vim.api.nvim_create_buf(false, true)
  end
  return vim.api.nvim_open_win(bufnr, false, {
    relative = 'editor',
    width = 10,
    height = 10,
    row = 10,
    col = 10,
    focusable = false,
    border = 'single'
  })
end

function M.start()
	winnr = open_win()
  local char
	while wait_for_input do
    char = vim.fn.getchar()
    if char == 27 then
      wait_for_input = false
    end
    
		--body
	end
  if vim.api.nvim_win_is_valid(winnr) then
    vim.api.nvim_win_close(winnr, true)
  end
end

return M
