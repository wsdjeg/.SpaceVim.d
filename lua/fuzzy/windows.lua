local w = {}

local prompt = require("spacevim.api.prompt")

-- open default windows

local bufnr = -1
local winid = -1

local function open_result_win()
	if not vim.api.nvim_buf_is_valid(bufnr) then
		bufnr = vim.api.nvim_create_buf(false, false)
	end
	if not vim.api.nvim_win_is_valid(winid) then
	end
end

function w.open(input, files, matcher)
	prompt._handle_fly = function(str)
    local result = matcher.filter(files, input)
    --
    -- {
      -- path/to/file = {{start, end}, {start, end}}
      -- path/to/file = {{start, end}, {start, end}}
      -- path/to/file = {{start, end}, {start, end}}
      -- path/to/file = {{start, end}, {start, end}}
    -- }
    --
    --
    --

  end
end

return w
