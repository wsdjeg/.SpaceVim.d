--=============================================================================
-- fuzzy.lua --- 
-- Copyright (c) 2019-2024 Wang Shidong & Contributors
-- Author: Wang Shidong < wsdjeg@outlook.com >
-- URL: https://spacevim.org
-- License: GPLv3
--=============================================================================

local fuzzy = {}


fuzzy.find = function(opt)
  local w = require('fuzzy.windows')
  local f = require('fuzzy.finder')
  local m = require('fuzzy.matcher')

  opt = opt or {}

  local p = opt.cwd or vim.fn.getcwd()
  local input = opt.input or ''
  w.open(input, f.find(p), m)
end


return fuzzy
