local builtins = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", builtins.find_files, {})
vim.keymap.set("n", "<leader>fg", builtins.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtins.buffers, {})
vim.keymap.set("n", "<leader>fh", builtins.help_tags, {})
