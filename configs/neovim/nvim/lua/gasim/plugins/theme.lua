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
        integrations = {
          blink_cmp = true,
          grug_far = true,
        },
      })

      vim.cmd.colorscheme("kaiku")
    end,
  },
}
