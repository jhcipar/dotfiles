  local modes = { "n", "v", "x", "i" }
  local path = vim.fn.stdpath("config") .. "/lua/cub/LEARN_AUTO.md"
  local file = io.open(path, "w")

  for _, mode in ipairs(modes) do
    for _, map in ipairs(vim.api.nvim_get_keymap(mode)) do
      if map.desc and map.desc:find("cub") then
        file:write(
          -- string.format("| %s | `%s` | %s |\n", mode, map.lhs, map.desc or map.rhs or "")
        string.format("%s, %s, %s, %s, %s\n", mode, map.rhs, map.abbr, map.desc, map.lhs)
        )
      end
    end
  end
