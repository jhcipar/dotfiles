local data = assert(vim.fn.stdpath "data") --[[@as string]]

require("telescope").setup {
    defaults = {
        file_ignore_patterns = { "dune.lock" },
    },
    extensions = {
        wrap_results = true,

        fzf = {},
        history = {
            path = vim.fs.joinpath(data, "telescope_history.sqlite3"),
            limit = 100,
        },
        ["ui-select"] = {
            require("telescope.themes").get_dropdown {},
        },
    },
}

pcall(require("telescope").load_extension, "fzf")
pcall(require("telescope").load_extension, "smart_history")
pcall(require("telescope").load_extension, "ui-select")

local builtin = require "telescope.builtin"

require('telescope').setup({ })

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>pF', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>pg', require "cub.custom.config.telescope.multi-ripgrep")
vim.keymap.set('n', '<leader>pws', function()
    local word = vim.fn.expand("<cword>")
    builtin.grep_string({ search = word })
end)

vim.keymap.set('n', '<leader>pWs', function()
    local word = vim.fn.expand("<cWORD>")
    builtin.grep_string({ search = word })
end)

vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

vim.keymap.set('n', '<leader>gr', function()
    builtin.git_commits(require('telescope.themes').get_ivy())
end)

vim.keymap.set("n", "<leader>gc", function()
    builtin.git_bcommits(require('telescope.themes').get_ivy())
end)

vim.keymap.set('n', '<leader>gb', function()
    builtin.git_branches(require('telescope.themes').get_ivy())
end)

vim.keymap.set('v', '<leader>gc', function()
    builtin.git_bcommits_range()
end, { desc = 'Git commits for selected lines' })

vim.keymap.set('n', '<leader>gv', function()
    builtin.git_stash(require('telescope.themes').get_ivy())
end)

vim.keymap.set('n', 'gd', function()
    builtin.lsp_definitions(require('telescope.themes').get_ivy())
end)

vim.keymap.set('n', 'grr', function()
    builtin.lsp_references(require('telescope.themes').get_ivy())
end)

-- todo is the telescope and lsp search

vim.keymap.set('n', '<leader>pm', function()
    builtin.marks(require('telescope.themes').get_ivy())
end)

vim.keymap.set("n", "<space>/", builtin.current_buffer_fuzzy_find)



--         require('telescope.builtin').find_files({
    --   layout_strategy = 'vertical',
    --   layout_config = { height = 0.95, width = 0.8 },
    -- })
    vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
    vim.keymap.set('n', '<leader>vk', builtin.keymaps, {})

