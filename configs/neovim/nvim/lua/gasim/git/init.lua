vim.api.nvim_set_keymap(
  "n",
  "<leader>gt",
  ":LazyGit<CR>",
  { noremap = true, silent = true }
)

vim.g.lazygit_floating_window_use_plenary = 1
