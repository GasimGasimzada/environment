local mode_icons = {
  n = "",
  no = "",
  v = "󱏒",
  V = "",
  ["\22"] = "▧", -- visual block
  i = "",
  ic = "",
  c = "",
  R = "󰛔",
  t = "",
}

return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      theme = "intent",
      sections = {
        lualine_a = {
          {
            "mode",
            fmt = function()
              return mode_icons[vim.fn.mode()] or "?"
            end,
          },
        },
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = {},
        lualine_y = { "diagnostics" },
        lualine_z = {},
      },
    },
  },
}
