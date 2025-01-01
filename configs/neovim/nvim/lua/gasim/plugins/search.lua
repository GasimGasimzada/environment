return {
  {
    "MagicDuck/grug-far.nvim",
    config = function()
      local grugFar = require("grug-far")
      grugFar.setup()
      vim.keymap.set("n", "<leader>fs", function()
        grugFar.open({ engine = "ripgrep" })
      end)

      vim.keymap.set("n", "<leader>fa", function()
        grugFar.open({ engine = "astgrep" })
      end)
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local themes = require("telescope.themes")
      require("telescope").setup({
        defaults = themes.get_dropdown({
          preview = false,
          layout_config = { width = 0.5, height = 0.75 },
        }),
      })
    end,
  },
  {
    "nvim-telescope/telescope-frecency.nvim",
    config = function()
      require("telescope").load_extension("frecency")

      vim.keymap.set("n", "<leader>ff", function()
        require("telescope").extensions.frecency.frecency({
          workspace = "CWD",
        })
      end)
    end,
  },
}
