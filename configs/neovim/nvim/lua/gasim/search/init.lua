require("grug-far").setup()

local grugFar = require("grug-far")

vim.keymap.set("n", "<leader>fs", function()
  grugFar.open({ engine = "ripgrep" })
end)

vim.keymap.set("n", "<leader>fa", function()
  grugFar.open({ engine = "astgrep" })
end)
