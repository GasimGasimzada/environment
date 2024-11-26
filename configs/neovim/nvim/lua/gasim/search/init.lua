require("grug-far").setup()

local grugFar = require("grug-far")

vim.keymap.set("n", "<leader>fs", function()
  grugFar.open()
end, {})
