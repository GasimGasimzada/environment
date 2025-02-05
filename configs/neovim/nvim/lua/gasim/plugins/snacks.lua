return {
  {
    "folke/snacks.nvim",
    lazy = false,
    priority = 1000,
    ---@type snacks.Config
    opts = {
      animate = {},
      notifier = {},
      scroll = {},
      indent = {
        animate = { enabled = false },
        scope = { enabled = false },
        chunk = {
          enabled = false,
          char = { arrow = "─" },
        },
      },
      picker = {
        layout = {
          preset = "dropdown",
          preview = false,
        },
      },
      gitbrowse = {
        notify = false,
        what = "file",
      },
      lazygit = {},
    },
    keys = {
      {
        "<leader>gt",
        function()
          Snacks.lazygit()
        end,
        desc = "LazyGit",
      },
      {
        "<leader>ff",
        function()
          Snacks.picker.smart({
            multi = { "files" },
          })
        end,
        desc = "Picker",
      },
    },
  },
}
