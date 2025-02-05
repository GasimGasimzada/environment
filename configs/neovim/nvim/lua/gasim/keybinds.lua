vim.keymap.set(
  "n",
  "<leader>sv",
  ":vsplit<CR><C-w>l",
  { noremap = true, silent = true }
)

-- Split panes
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })

-- Tabs
vim.keymap.set("n", "<leader>1", "1gt", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>2", "2gt", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>3", "3gt", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>4", "4gt", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>5", "5gt", { noremap = true, silent = true })
