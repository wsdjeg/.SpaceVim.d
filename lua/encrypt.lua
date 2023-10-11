--!/usr/bin/lua
--
-- encrypt and decrypt

local M = {}

local str = require('spacevim.api.data.string')

local key = ''

local function encode(chars)
  
end

function M.encrypt()
  local text = table.concat(vim.api.nvim_buf_get_lines(0, 0, -1, false), '\n')
  local chars = str.string2chars(text)


  
end


function M.decrypt()
  
end

function M.setup(config)
  
end


return M
