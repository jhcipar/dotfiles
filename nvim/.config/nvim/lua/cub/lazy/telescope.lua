return {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.5",

    dependencies = {
        "nvim-lua/plenary.nvim"
    },

    config = function()
        local builtin = require('telescope.builtin')

        require('telescope').setup({ })

        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        vim.keymap.set('n', '<leader>pF', builtin.oldfiles, {})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
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

        vim.keymap.set('n', '<leader>pr', function()
            builtin.grep_string({ 
                search = vim.fn.input("Regex Grep > "),
                use_regex = true 
            })
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

        vim.keymap.set('n', '<leader>pb', function()
            builtin.current_buffer_fuzzy_find(require('telescope.themes').get_ivy())
        end)




        --         require('telescope.builtin').find_files({
            --   layout_strategy = 'vertical',
            --   layout_config = { height = 0.95, width = 0.8 },
            -- })
            vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
            vim.keymap.set('n', '<leader>vk', builtin.keymaps, {})
        end
    }

