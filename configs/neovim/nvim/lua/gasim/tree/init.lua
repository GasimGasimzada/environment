require("neo-tree").setup({
  filesystem = {
    follow_current_file = {
      enabled = true,
      leave_dirs_open = true,
    },
    hijack_netrw_behavior = "open_current",
  },
  buffers = {
    follow_current_file = { enabled = true },
  },
  window = {
    position = "float",
    mappings = {
      ["<C-v>"] = "open_vsplit",
      ["<C-t>"] = "open_tabnew",
    },
  },
})

vim.api.nvim_set_keymap(
  "n",
  "<leader>tr",
  ":Neotree reveal<CR>",
  { noremap = true, silent = true }
)
