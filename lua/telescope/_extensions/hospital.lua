local actions = require("telescope.actions")
local actions_state = require("telescope.actions.state")
local actions_set = require("telescope.actions.set")
local finders = require("telescope.finders")
local pickers = require("telescope.pickers")
local conf = require("telescope.config").values
local previewers = require("telescope.previewers")

local function get_hospital()
	local hospital_bufnr = vim.fn.bufadd("d:/me/work.md")
	vim.fn.bufload(hospital_bufnr)
	local hospitals = {}
	local hospital = {}
	local is_code_block = false
	local filepath = vim.api.nvim_buf_get_name(hospital_bufnr)
	for linenr, line in ipairs(vim.api.nvim_buf_get_lines(hospital_bufnr, 0, -1, false)) do
		if not is_code_block then
			if vim.startswith(line, "# ") then
				hospital.city = string.sub(line, 3)
			elseif vim.startswith(line, "- 医院等级：") then
				hospital.leval = string.sub(line, 18)
			elseif vim.startswith(line, "- 医院等级:") then
				hospital.leval = string.sub(line, 16)
			end
		end
		-- process markdown code blocks
		if vim.startswith(line, "```") then
			is_code_block = not is_code_block
			goto next
		else
			if is_code_block then
				goto next
			end
		end
		if vim.startswith(line, "### ") then
			if hospital.name then
				table.insert(hospitals, hospital)
			end
			hospital = {
				name = string.sub(line, 5),
				line = linenr + 1,
				path = filepath,
			}
		end

		::next::
	end

	if hospital.name then
		table.insert(hospitals, hospital)
	end

	return hospitals
end

local function pick_hospital(opts)
	opts = opts or {}

	local headings = get_hospital()
	if headings == nil then
		return
	end
	pickers
		.new(opts, {
			prompt_title = "输入筛选",
			results_title = "医院列表",
			finder = finders.new_table({
				results = headings,
				entry_maker = function(entry)
					return {
						value = entry.line,
						display = entry.name .. " " .. entry.leval,
						ordinal = entry.name .. " " .. entry.leval,
						filename = entry.path,
						lnum = entry.line,
					}
				end,
			}),
			previewer = previewers.new_buffer_previewer({
				title = "客户信息",
				define_preview = function(self, entry, status)
					local preview_text = {}
					for _, v in ipairs(vim.api.nvim_buf_get_lines(hospital_bufnr, entry.value, -1, false)) do
						table.insert(preview_text, v)
						if vim.startswith(v, "#") then
							table.remove(preview_text, #preview_text)
							break
						end
					end
					vim.api.nvim_buf_set_lines(self.state.bufnr, 0, -1, false, preview_text)
				end,
			}),
			sorter = conf.file_sorter(opts),
			attach_mappings = function(prompt_bufnr)
				actions_set.select:replace(function()
					local entry = actions_state.get_selected_entry()
					actions.close(prompt_bufnr)
					vim.cmd(string.format("e +%d " .. entry.filename, entry.value))
					vim.cmd("set buflisted")
				end)
				return true
			end,
		})
		:find()
end

return require("telescope").register_extension({
	exports = {
		hospital = pick_hospital,
	},
})
