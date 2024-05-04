local List = {
  __index = function(t, key)
    print('get key:' .. key)
  end,
  __newindex = function(t, key, v)
    print('set key:' .. key)
  end
}


local w = {}

setmetatable(w, List)

local v = {w}
setmetatable(v, List)

print(v[1])

v.s = 1

print(v.s)


