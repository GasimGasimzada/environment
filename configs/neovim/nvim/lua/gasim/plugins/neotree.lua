return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    lazy = false,
    config = function()
      local function on_move(data)
        Snacks.rename.on_rename_file(data.source, data.destination)

        local buffers = vim.api.nvim_list_bufs()
        for _, buf in ipairs(buffers) do
          if vim.api.nvim_buf_get_option(buf, "modified") then
            vim.api.nvim_buf_call(buf, function()
              vim.cmd("write") -- Equivalent to :w
            end)
          end
        end
      end
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

        event_handlers = {
          {
            event = "file_moved",
            handler = on_move,
          },
          {
            event = "file_renamed",
            handler = on_move,
          },
        },
      })

      vim.keymap.set(
        "n",
        "<leader>fe",
        ":Neotree reveal<CR>",
        { noremap = true, silent = true }
      )
    end,
  },
}
