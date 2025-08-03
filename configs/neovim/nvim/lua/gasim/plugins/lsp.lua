return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "tsx", "typescript", "rust" },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      })
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
      completion = { documentation = { auto_show = true } },
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
          javascript = { "prettierd", "biome" },
          typescript = { "prettierd", "biome" },
          javascriptreact = { "prettierd", "biome" },
          typescriptreact = { "prettierd", "biome" },
          css = { "prettierd" },
          html = { "prettierd" },
          json = { "prettierd" },
          yaml = { "prettierd" },
          markdown = { "prettierd" },
          lua = { "stylua" },
          go = { "gofmt", "goimports" },
          nix = { "nixfmt" },
        },
        format_on_save = {},
        formatters = {
          prettierd = { require_cwd = true },
          biome = { require_cwd = true },
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
