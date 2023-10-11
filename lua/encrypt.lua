--!/usr/bin/lua
--
-- encrypt and decrypt

local M = {}

local key = ''

function M.encrypt()
  local text = table.concat(vim.api.nvim_buf_get_lines(0, 0, -1, false), '\n')


  
end


function M.decrypt()
  
end

function M.setup(config)
  
end


return M
