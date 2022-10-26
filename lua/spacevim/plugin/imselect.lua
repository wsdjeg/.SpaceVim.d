--=============================================================================
-- imselect.lua --- im-select plugin
-- Copyright (c) 2016-2022 Wang Shidong & Contributors
-- Author: Wang Shidong < wsdjeg@outlook.com >
-- URL: https://spacevim.org
-- License: GPLv3
--=============================================================================


local M = {}


function M.english() -- {{{
  pcall(vim.fn.system, 'fcitx-remote -c')
end
-- }}}


function M.insert() -- {{{
  
end
-- }}}


return M
