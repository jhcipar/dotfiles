return {
    {
        "kevinhwang91/nvim-bqf",
        enabled = true,
        config = function()
            require("bqf").setup()
        end,
    },
    {
        "stevearc/qf_helper.nvim",
        opts = {},
        func_map = {
            delete = 'd',      -- delete selected items (works with dd or visual mode)
            filter = 'zn',     -- keep only selected
            filterr = 'zN',    -- remove selected
        },
    },
}
