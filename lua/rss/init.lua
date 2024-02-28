--=============================================================================
-- init.lua --- nvim rss plugin
-- Copyright (c) 2016-2022 Wang Shidong & Contributors
-- Author: Wang Shidong < wsdjeg@outlook.com >
-- URL: https://spacevim.org
-- License: GPLv3
--=============================================================================

local M = {}

local cfg = require('rss.config')

local viewer = require('rss.viewer')


function M.setup(opt)

  cfg.rss_cache_dir = opt.cache_dir or '~/.cache/nvim-rss/'

  cfg.enable_default_mapping = opt.enable_default_mapping or true

  cfg.enable_default_command = opt.enable_default_command or true
  
  cfg.setup()
end

function M.open()
  viewer.open()
end


return M
