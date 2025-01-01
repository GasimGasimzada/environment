vim.g.lazygit_floating_window_use_plenary = 1

return {
  {
    "linrongbin16/gitlinker.nvim",
    cmd = "GitLink",
    opts = {},
    keys = {},
  },
  {
    "kdheepak/lazygit.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>gt", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  },
}
