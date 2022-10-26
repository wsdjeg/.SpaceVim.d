local actions = require('telescope.actions')
local actions_state = require('telescope.actions.state')
local actions_set = require('telescope.actions.set')
local finders = require('telescope.finders')
local pickers = require('telescope.pickers')
local conf = require('telescope.config').values


local function get_hospital()
    local headings = {}
    local index = 1
    local is_code_block = false
    local bufnr = vim.fn.bufadd('d:/me/work.md')
    vim.fn.bufload(bufnr)
    local index, total = 1, vim.api.nvim_buf_line_count(bufnr)
    local filepath = vim.api.nvim_buf_get_name(bufnr)
    while index <= total do
        local line = vim.fn.getbufline(bufnr, index)[1]
        -- process markdown code blocks
        if vim.startswith(line, '```') then
            is_code_block = not is_code_block
            goto next
        else
            if is_code_block then
                goto next
            end
        end
        -- match heading
        if vim.startswith(line, '### ') then
            table.insert(headings, {
                heading = vim.trim(line),
                line = index,
                path = filepath,
            })
        end

        ::next::
        index = index + 1
    end

    return headings
end


local function pick_hospital(opts)
    opts = opts or {}

    local headings = get_hospital()
    if headings == nil then
        return
    end
    pickers.new(opts, {
        prompt_title = '医院信息',
        -- results_title = 'Headings',
        finder = finders.new_table({
            results = headings,
            entry_maker = function(entry)
                return {
                    value = entry.line,
                    display = entry.heading,
                    ordinal = entry.heading,
                    filename = entry.path,
                    lnum = entry.line,
                }
            end,
        }),
        previewer = conf.qflist_previewer(opts),
        sorter = conf.file_sorter(opts),
        attach_mappings = function(prompt_bufnr)
            actions_set.select:replace(function()
                local entry = actions_state.get_selected_entry()
                actions.close(prompt_bufnr)
                vim.cmd(string.format('e +%d ' .. entry.filename, entry.value))
            end)
            return true
        end,
    }):find()
end

return require("telescope").register_extension({
    exports = {
        hospital = pick_hospital,
    },
})
