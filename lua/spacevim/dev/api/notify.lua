--!/usr/bin/lua
local M = {}

local function noautocmd(f)
  local s = vim.o.eventignore
  vim.o.eventignore = 'all'
  pcall(f)
  vim.o.eventignore = s
end

local winid = -1

noautocmd(function()
  vim.api.nvim_win_close(winid, true)
end)

return M
