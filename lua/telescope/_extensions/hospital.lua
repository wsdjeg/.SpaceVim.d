local actions = require("telescope.actions")
local actions_state = require("telescope.actions.state")
local actions_set = require("telescope.actions.set")
local finders = require("telescope.finders")
local pickers = require("telescope.pickers")
local conf = require("telescope.config").values
local previewers = require("telescope.previewers")
local entry_display = require('telescope.pickers.entry_display')

local function get_hospital()
	local hospital_bufnr = vim.fn.bufadd("d:/me/work.md")
	vim.fn.bufload(hospital_bufnr)
	local hospitals = {}
	local hospital = {}
	local in_hospital_context = false
	local city = ""
  local quxian = ''
	local is_code_block = false
	local filepath = vim.api.nvim_buf_get_name(hospital_bufnr)
	for linenr, line in ipairs(vim.api.nvim_buf_get_lines(hospital_bufnr, 0, -1, false)) do
		if not is_code_block then
			if vim.startswith(line, "# ") then
				city = string.sub(line, 3)
				in_hospital_context = false
      elseif vim.startswith(line, "## ") then
				quxian = string.sub(line, 4)
				in_hospital_context = false
			elseif vim.startswith(line, "- 医院等级：") then
				hospital.leval = string.sub(line, 18)
			elseif vim.startswith(line, "- 医院等级:") then
				hospital.leval = string.sub(line, 16)
			end
		end
		if not vim.startswith(line, '### ') and in_hospital_context then
			table.insert(hospital.context, line)
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
				city = city,
        quxian = quxian,
				line = linenr + 1,
				path = filepath,
        leval = '',
				context = {},
			}
      in_hospital_context = true
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

	local hospitals = get_hospital()
	if hospitals == nil then
		return
	end
  local displayer = entry_display.create({
    separator = ' ',
    items = {
      { width = 50 },
      { width = 10 },
      { remaining = true },
    },
  })
  local function make_display(entry)
    -- print(vim.inspect(entry))
    return displayer({
      { entry.value.name or '', 'TelescopeResultsVariable' },
      { entry.value.leval or '', 'TelescopeResultsComment' },
      {
        entry.value.city .. ' ' .. entry.value.quxian,
        'TelescopeResultsComment',
      },
    })
  end
	pickers
		.new(opts, {
			prompt_title = "输入筛选",
			results_title = "医院列表",
			finder = finders.new_table({
				results = hospitals,
				entry_maker = function(entry)
					return {
            value = entry,
            display = make_display,
						ordinal = entry.name .. " " .. entry.leval,
						filename = entry.path,
						lnum = entry.line,
            context = entry.context,
					}
				end,
			}),
			previewer = previewers.new_buffer_previewer({
				title = "客户信息",
				define_preview = function(self, entry, status)
					vim.api.nvim_buf_set_lines(self.state.bufnr, 0, -1, false, entry.context)
				end,
			}),
			sorter = conf.file_sorter(opts),
			attach_mappings = function(prompt_bufnr)
				actions_set.select:replace(function()
					local entry = actions_state.get_selected_entry()
					actions.close(prompt_bufnr)
					vim.cmd(string.format("e +%d " .. entry.filename, entry.lnum))
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
