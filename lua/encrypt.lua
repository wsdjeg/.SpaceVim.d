--!/usr/bin/lua
--
-- encrypt and decrypt

local M = {}

local str = require("spacevim.api.data.string")

local key = 5

local function encode(char)
  return vim.fn.char2nr(char) + key
  
end

function M.encrypt()
	local text = table.concat(vim.api.nvim_buf_get_lines(0, 0, -1, false), "\n")
	local chars = str.string2chars(text)
	local rst = {}
	for _, c in ipairs(chars) do
		table.insert(rst, encode(c))
	end

	vim.api.nvim_buf_set_lines(0, 1, -1, false, rst)
end

function M.decrypt() end

function M.setup(config) end

return M
