--!/usr/bin/lua
-- IMPORTANT: make sure to setup neodev BEFORE lspconfig
require("neodev").setup({
  -- add any options here, or leave empty to use the default settings
})

local lua_rtp = vim.split(package.path, ";")
table.insert(lua_rtp, "lua/?.lua")
table.insert(lua_rtp, "lua/?/init.lua")
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
				library = vim.api.nvim_get_runtime_file("", true),
				preloadFileSize = 2000,
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
})


