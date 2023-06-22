local M = {}


function M.test() -- {{{
  local a = {}
  a.t = true
  function a.change_t() -- {{{
    a.t = false
  end
  function a.get_t() -- {{{
    return a.t
  end
  -- }}}
  return a
  -- }}}
end
-- }}}


return M
