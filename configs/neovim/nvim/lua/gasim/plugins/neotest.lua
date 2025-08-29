return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/neotest-jest",
  },
  config = function()
    local neotest = require("neotest")

    neotest.setup({
      adapters = {
        require("neotest-jest")({
          cwd = function()
            return vim.fn.getcwd()
          end,
        }),
      },
    })

    vim.keymap.set("n", "<leader>tt", function()
      neotest.summary.open()
    end, { noremap = true, silent = true })
  end,
}
