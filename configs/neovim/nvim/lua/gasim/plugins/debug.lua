return {
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      require("nvim-dap-virtual-text").setup()

      dapui.setup({
        layouts = {
          {
            elements = {
              { id = "breakpoints", size = 0.15 },
              { id = "stacks", size = 0.20 },
              { id = "watches", size = 0.65 },
            },
            position = "left",
            size = 40,
          },
          {
            elements = {
              { id = "repl", size = 0.5 },
              { id = "console", size = 0.5 },
            },
            position = "bottom",
            size = 10,
          },
        },
      })

      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end

      dap.adapters["pwa-node"] = {
        type = "server",
        host = "::1",
        port = 8123,
        executable = {
          command = "js-debug",
          runtimeArgs = { 8123 },
        },
      }

      for _, language in ipairs({ "javascript", "typescript" }) do
        dap.configurations[language] = {
          {
            type = "pwa-node",
            request = "launch",
            name = "Debug Jest Test",
            program = "${file}",
            cwd = "${workspaceFolder}",
            runtimeArgs = {
              "./node_modules/.bin/jest",
              "--runInBand",
              "--no-cache",
            },
            rootPath = "${workspaceFolder}",
            console = "integratedTerminal",
            internalConsoleOptions = "neverOpen",
          },
        }
      end

      vim.fn.sign_define("DapBreakpoint", {
        text = "",
        texthl = "DapBreakpoint",
        linehl = "",
        numhl = "",
      })

      vim.fn.sign_define("DapBreakpointCondition", {
        text = "",
        texthl = "DapBreakpointCondition",
        linehl = "",
        numhl = "",
      })

      vim.fn.sign_define("DapBreakpointRejected", {
        text = "",
        texthl = "DapBreakpointRejected",
        linehl = "",
        numhl = "",
      })

      vim.fn.sign_define("DapLogPoint", {
        text = "",
        texthl = "DapLogPoint",
        linehl = "",
        numhl = "",
      })

      vim.fn.sign_define("DapStopped", {
        text = "",
        texthl = "DapStopped",
        linehl = "DapStoppedLine",
        numhl = "",
      })

      vim.keymap.set("n", "<leader>bp", function()
        dap.toggle_breakpoint()
      end, { noremap = true, silent = true })

      vim.keymap.set("n", "<leader>bc", function()
        dap.set_breakpoint(vim.fn.input("Condition: "))
      end, { noremap = true, silent = true })

      vim.keymap.set("n", "<leader>bl", function()
        dap.set_breakpoint(nil, nil, vim.fn.input("Log: "))
      end, { noremap = true, silent = true })
    end,
  },
}
