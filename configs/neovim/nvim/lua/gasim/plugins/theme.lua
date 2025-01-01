return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        show_end_of_buffer = true,
      })

      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
