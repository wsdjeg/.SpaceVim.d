local lua_rtp = vim.split(package.path, ";")
table.insert(lua_rtp, "lua/?.lua")
table.insert(lua_rtp, "lua/?/init.lua")
local lua_ls = require("lspconfig").lua_ls
if lua_ls then
	require("lspconfig").lua_ls.setup({
		cmd = {
			"lua-language-server",
			"--logpath",
			"C:\\Users\\wsdjeg\\.cache\\lua-language-server",
			"--metapath",
			"C:\\Users\\wsdjeg\\.cache\\lua-language-server\\meta",
		},
		settings = {
			Lua = {
				runtime = {
					-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
					version = "LuaJIT",
					path = lua_rtp,
				},
				diagnostics = {
					-- Get the language server to recognize the `vim` global
					globals = { "vim" },
					disable = { "need-check-nil" },
				},
				workspace = {
					-- Make the server aware of Neovim runtime files
					library = vim.tbl_filter(function(var)
						if string.match(var, "SpaceVim\\bundle") then
							return false
						elseif string.match(var, "wsdjeg\\.cache") then
							return false
						end
						return true
					end, vim.api.nvim_get_runtime_file("", true)),
					preloadFileSize = 2000,
					ignoreDir = { "bundle" },
				},
				-- Do not send telemetry data containing a randomized but unique identifier
				telemetry = {
					enable = false,
				},
			},
		},
	})
end
