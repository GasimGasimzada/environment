return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup()
      require("nvim-treesitter").install({
        "tsx",
        "typescript",
        "markdown",
        "rust",
      })

      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          pcall(vim.treesitter.start)
        end,
      })
    end,
  },

  {
    "chrisgrieser/nvim-origami",
    event = "VeryLazy",
    opts = {
      autoFold = {
        enabled = true,
        kinds = { "imports" }, ---@type lsp.FoldingRangeKind[]
      },
    },
    init = function()
      vim.opt.foldlevel = 99
      vim.opt.foldlevelstart = 99
    end,
  },

  {
    "saghen/blink.cmp",
    version = "1.*",
    -- @module "blink.cmp"
    -- @type blink.cmp.Config
    opts = {
      keymap = { preset = "enter" },
      appearance = {
        nerd_font_variant = "mono",
      },
      completion = {
        documentation = {
          auto_show = true,
        },
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
      fuzzy = { implementation = "prefer_rust_with_warning" },
    },
  },

  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local conform = require("conform")
      conform.setup({
        formatters_by_ft = {
          javascript = { "oxfmt", "biome-check" },
          typescript = { "oxfmt", "biome-check" },
          javascriptreact = { "oxfmt", "biome-check" },
          typescriptreact = { "oxfmt", "biome-check" },
          md = { "prettierd" },
          mdx = { "prettierd" },
          css = { "prettierd" },
          html = { "prettierd" },
          json = { "prettierd" },
          jsonc = { "prettierd" },
          yaml = { "prettierd" },
          markdown = { "prettierd" },
          lua = { "stylua" },
          go = { "gofmt", "goimports" },
          nix = { "nixfmt" },
          qml = { "qmlformat" },
        },
        format_on_save = {},
        formatters = {
          prettierd = { require_cwd = true },
          biome = { require_cwd = true },
          qmlformat = {
            command = "qmlformat",
            args = { "--inplace", "$FILENAME" },
            stdin = false, -- qmlformat edits files directly
          },
        },
      })
    end,
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    specs = {
      "folke/snacks.nvim",
      opts = function(_, opts)
        return vim.tbl_deep_extend("force", opts or {}, {
          picker = {
            actions = require("trouble.sources.snacks").actions,
          },
        })
      end,
    },
  },
}
