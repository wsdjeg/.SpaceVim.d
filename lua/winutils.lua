local function isdirectory(fpath)
    local f, err, code = io.open(fpath, "r")
    if f ~= nil then
        f:close()
        return false
    else
        print(err)
    end
    return code == 13
end

local function substitute(expr, pat, sub, flags)
    
end
