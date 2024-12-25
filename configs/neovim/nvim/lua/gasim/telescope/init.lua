local themes = require("telescope.themes")

require("telescope").setup({
  defaults = themes.get_dropdown({
    preview = false,
    layout_config = { width = 0.5, height = 0.75 },
  }),
})

vim.keymap.set("n", "<leader>ff", function()
  require("telescope").extensions.frecency.frecency({
    workspace = "CWD",
    path_display = { "filename_first" },
  })
end)
