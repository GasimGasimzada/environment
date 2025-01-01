return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "tsx", "typescript", "rust" },
      })
    end,
  },
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
  },
  {
    "williamboman/mason.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "williamboman/mason-lspconfig.nvim",
      "VonHeikemen/lsp-zero.nvim",
    },
    config = function()
      vim.g.loaded_perl_provider = 0
      vim.g.loaded_ruby_provider = 0

      local lsp_zero = require("lsp-zero")
      lsp_zero.on_attach(function(client, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        lsp_zero.default_keymaps({ buffer = bufnr })
      end)

      require("mason").setup({})
      require("mason-lspconfig").setup({
        ensure_installed = {
          "ts_ls",
          "html",
          "tailwindcss",
          "lua_ls",
          "powershell_es",
        },
        handlers = {
          lsp_zero.default_setup,
        },
      })
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-vsnip",
      "hrsh7th/vim-vsnip",
    },
    config = function()
      local cmp = require("cmp")

      cmp.setup({
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-k>"] = cmp.mapping.select_prev_item(),
          ["<C-j>"] = cmp.mapping.select_next_item(),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = false }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "vsnip" },
        }, { name = "buffer" }),
      })

      vim.keymap.set("n", "ge", function()
        vim.diagnostic.open_float()
      end)
    end,
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
  },
}
