return {
    -- dir = "/Users/jacobcipar/work/99",
    "ThePrimeagen/99",
    config = function()
        local _99 = require("99")

        -- For logging that is to a file if you wish to trace through requests
        -- for reporting bugs, i would not rely on this, but instead the provided
        -- logging mechanisms within 99.  This is for more debugging purposes
        local cwd = vim.uv.cwd()
        local basename = vim.fs.basename(cwd)
        _99.setup({
            logger = {
                level = _99.DEBUG,
                path = "/tmp/" .. basename .. ".99.debug",
                print_on_error = true,
            },

            completion = {
                custom_rules = {
                    "~/work/skills/skills/",
                },
                files = {
                    enabled = true,
                    max_file_size = 102400,     -- bytes, skip files larger than this
                    max_files = 5000,            -- cap on total discovered files
                    exclude = { ".env", ".env.*", "node_modules", ".git" },
                },
                source = "cmp",
            },
            show_in_flight_requests = true,

            -- model = "opencode/glm-4.7-free",
            model = "openai/gpt-5.3-codex",
            --- md_files is a list of files to look for and auto add based on the location
            --- of the originating request.  That means if you are at /foo/bar/baz.lua
            --- the system will automagically look for:
            --- /foo/bar/AGENT.md
            --- /foo/AGENT.md
            --- assuming that /foo is project root (based on cwd)
            md_files = {
                "AGENT.md",
            },
        })
        --- work extension to try out
        vim.keymap.set("n", "<leader>9wd", function()
            _99.Extensions.Worker.set_work()
        end)

        vim.keymap.set("n", "<leader>9ww", function()
            _99.Extensions.Worker.work()
        end)

        vim.keymap.set("n", "<leader>9wg", function()
            print(_99.Extensions.Worker.current_work_item)
        end)

        vim.keymap.set("v", "<leader>9v", function()
            _99.visual()
        end)

        --- if you have a request you dont want to make any changes, just cancel it
        vim.keymap.set("n", "<leader>9x", function()
            _99.stop_all_requests()
        end)

        vim.keymap.set("n", "<leader>9s", function()
            _99.search()
        end)
    end,
}

