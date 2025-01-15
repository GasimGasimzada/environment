-- Keybind leaders
vim.g.mapleader = " "
vim.g.maplocalleader = ";"

-- Line numbers
vim.o.number = true
vim.o.relativenumber = true

-- Search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Tabs
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

vim.o.shell = os.getenv("SHELL")

if vim.fn.has("win32") == 1 then
  vim.o.shell = "pwsh /nologo"
  vim.o.shellcmdflag =
    "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
  vim.o.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"
  vim.o.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
  vim.o.shellquote = ""
  vim.o.shellxquote = ""
else
  vim.o.shell = os.getenv("SHELL") or "zsh"
end
