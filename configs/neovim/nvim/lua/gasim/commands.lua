vim.api.nvim_create_user_command("GitShare", function(opts)
  local line_str = opts.range == 0 and ("line %d"):format(vim.fn.line("."))
    or ("lines %d:%d"):format(opts.line1, opts.line2)

  local open = function(url)
    if opts.bang then
      vim.fn.setreg("+", url)
      Snacks.notify(
        ("Copied Git link for %s to clipboard"):format(line_str),
        { title = "Git Share" }
      )
    else
      require("lazy.util").open(url, { system = true })
      Snacks.notify(
        ("Opening Git link for %s in browser"):format(line_str),
        { title = "Git Share" }
      )
    end
  end

  if opts.range == 0 then
    Snacks.gitbrowse({ open = open })
  else
    Snacks.gitbrowse({
      open = open,
      line_start = opts.line1,
      line_end = opts.line2,
    })
  end
end, { bang = true, range = true })

vim.api.nvim_create_user_command("Picker", function()
  Snacks.picker()
end, {})
