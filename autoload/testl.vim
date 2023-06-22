function! testl#test() abort
  return luaeval('require("testluaeval").test()')
endfunction
