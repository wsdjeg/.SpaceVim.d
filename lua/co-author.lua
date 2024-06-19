local M = {}
local co_author = {}
co_author.generate = function()
	local co_authors = vim.fn.systemlist('git log --format="%aN <%aE>"')
	local unique_co_authors = {}
	for _, author in ipairs(co_authors) do
		if not unique_co_authors[author] then
			unique_co_authors[author] = true
			unique_co_authors[#unique_co_authors + 1] = author
		end
	end
	return unique_co_authors
end

M.list = function()
	local co_authors = co_author.generate()
	local items = {}
	for _, author in ipairs(co_authors) do
		items[#items + 1] = author
	end
	if #co_authors > 0 then
		vim.ui.select(items, { prompt = "Select Co-Author" }, function(item, _)
			if item ~= nil then
				local string = "Co-authored-by: " .. item
				local line, column = unpack(vim.api.nvim_win_get_cursor(0))

				vim.api.nvim_buf_set_lines(0, line, line, true, { string })
				vim.api.nvim_win_set_cursor(0, { line, column + #string })
			end
		end)
	end
end
return M
