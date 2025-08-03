vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.api.nvim_create_autocmd("LspAttach", {
  desc = "LSP actions",
  callback = function(event)
    local opts = { buffer = event.buf }
    vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
    vim.keymap.set(
      "n",
      "ge",
      "<cmd>lua vim.diagnostic.open_float({ border = 'rounded' })<cr>",
      opts
    )

    vim.keymap.set("n", "gR", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
  end,
})

vim.lsp.handlers["textDocument/hover"] = function(_, result, ctx, config)
  config = config or {}
  config.focus_id = ctx.method
  config.border = "rounded"

  if not (result and result.contents) then
    return
  end

  local markdown_lines =
    vim.lsp.util.convert_input_to_markdown_lines(result.contents)
  markdown_lines = vim.lsp.util.trim_empty_lines(markdown_lines)

  if vim.tbl_isempty(markdown_lines) then
    return
  end

  return vim.lsp.util.open_floating_preview(markdown_lines, "markdown", config)
end

vim.lsp.enable("lua")
vim.lsp.enable("typescript")
vim.lsp.enable("tailwindcss")
vim.lsp.enable("oxc")
