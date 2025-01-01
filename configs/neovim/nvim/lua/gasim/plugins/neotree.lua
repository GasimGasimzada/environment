return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    event = "VimEnter",
    config = function()
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

      vim.keymap.set(
        "n",
        "<leader>tr",
        ":Neotree reveal<CR>",
        { noremap = true, silent = true }
      )
    end,
  },
}
