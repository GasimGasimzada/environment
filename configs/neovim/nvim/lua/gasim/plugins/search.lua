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
}
