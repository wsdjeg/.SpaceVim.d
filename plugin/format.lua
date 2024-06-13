pcall(function()
	require("format").setup({
		custom_formatters = {
			lua = {
				exe = "stylua",
				args = { "-" },
				stdin = true,
			},
		},
	})
end)
