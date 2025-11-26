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
      input = {},
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
        "<leader>.",
        function()
          Snacks.scratch()
        end,
        desc = "Toggle scratch buffer",
      },
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
        desc = "Find files",
      },
      {
        "<leader>bb",
        function()
          Snacks.picker.buffers()
        end,
        desc = "Buffers",
      },
      {
        "<leader>pp",
        function()
          Snacks.picker()
        end,
        desc = "Picker",
      },

      {
        "<leader>dg",
        function()
          Snacks.picker.diagnostics()
        end,
        desc = "Diagnostics",
      },
      {
        "gd",
        function()
          Snacks.picker.lsp_definitions()
        end,
        desc = "Goto Definition",
      },
      {
        "gD",
        function()
          Snacks.picker.lsp_declarations()
        end,
        desc = "Goto Declaration",
      },
      {
        "gr",
        function()
          Snacks.picker.lsp_references()
        end,
        nowait = true,
        desc = "References",
      },
      {
        "gi",
        function()
          Snacks.picker.lsp_implementations()
        end,
        desc = "Goto Implementation",
      },
      {
        "gy",
        function()
          Snacks.picker.lsp_type_definitions()
        end,
        desc = "Goto T[y]pe Definition",
      },
      {
        "gs",
        function()
          Snacks.picker.lsp_symbols()
        end,
        desc = "LSP Symbols",
      },
    },
  },
}
