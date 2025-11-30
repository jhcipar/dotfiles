return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local gitsigns = require("gitsigns")

      gitsigns.setup({
        signs = {
          add = { text = "+" },
          change = { text = "~" },
          delete = { text = "_" },
          topdelete = { text = "^" },
          changedelete = { text = "~" },
        },
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns
          local function map(mode, lhs, rhs, desc, opts)
            opts = opts or {}
            opts.buffer = bufnr
            opts.desc = desc
            vim.keymap.set(mode, lhs, rhs, opts)
          end

          map("n", "]h", gs.next_hunk, "Next Git hunk")
          map("n", "[h", gs.prev_hunk, "Previous Git hunk")
          map({ "n", "v" }, "<leader>hs", function()
            gs.stage_hunk()
          end, "Stage hunk")
          map({ "n", "v" }, "<leader>hr", function()
            gs.reset_hunk()
          end, "Reset hunk")
          map("n", "<leader>hp", gs.preview_hunk, "Preview hunk")
          map("n", "<leader>hd", gs.diffthis, "Diff against index")
          map("n", "<leader>hD", function()
            gs.diffthis("~")
          end, "Diff against HEAD")
          map("n", "<leader>hS", gs.stage_buffer, "Stage buffer")
          map("n", "<leader>hu", gs.undo_stage_hunk, "Undo stage hunk")
          map("n", "<leader>hR", gs.reset_buffer, "Reset buffer")
          map("n", "<leader>hb", gs.toggle_current_line_blame, "Toggle line blame")
        end,
      })
    end,
  },
}
