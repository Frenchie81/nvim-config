return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "nvim-neotest/nvim-nio",
    -- UI for nvim-dap
    "rcarriga/nvim-dap-ui",

    -- Virtual text for debugging
    "theHamsta/nvim-dap-virtual-text",

    -- Mason integration
    "jay-babu/mason-nvim-dap.nvim",

    -- c_sharp integration
    "nicholasmata/nvim-dap-cs",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    require("mason-nvim-dap").setup({
      ensure_installed = { "netcoredbg" },
      handlers = {},
    })

    dapui.setup()

    require("nvim-dap-virtual-text").setup()

    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end

    -- Keymaps
    vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
    vim.keymap.set("n", "<Leader>dc", dap.continue, { desc = "Continue" })
    vim.keymap.set("n", "<Leader>di", dap.step_into, { desc = "Step into" })
    vim.keymap.set("n", "<Leader>do", dap.step_over, { desc = "Step over" })
    vim.keymap.set("n", "<Leader>dO", dap.step_out, { desc = "Step out" })
    vim.keymap.set("n", "<Leader>dr", dap.repl.open, { desc = "Open REPL" })
    vim.keymap.set("n", "<Leader>dl", dap.run_last, { desc = "Run last" })
    vim.keymap.set("n", "<Leader>du", dapui.toggle, { desc = "Toggle DAP UI" })
    vim.keymap.set("n", "<F5>", dap.continue, { desc = "Continue" })
    vim.keymap.set("n", "<F9>", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
    vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Step over" })
    vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Step into" })

    -- dap.configurations.cs = {
    --   {
    --     type = "coreclr",
    --     name = "launch - netcoredbg",
    --     request = "launch",
    --     program = function()
    --       return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/bin/Debug/", "file")
    --     end,
    --   },
    --   {
    --     type = "coreclr",
    --     name = "dap-cs-test",
    --     request = "launch",
    --     program = "${command:get_neotest_cs_project_path}",
    --   },
    -- }

    -- configure cs
    require("dap-cs").setup({
      dap_configurations = {
        {
          -- Must be "coreclr" or it will be ignored by the plugin
          type = "coreclr",
          name = "Attach remote",
          mode = "remote",
          request = "attach",
        },
      },
      netcoredbg = {
        -- the path to the executable netcoredbg which will be used for debugging.
        -- by default, this is the "netcoredbg" executable on your PATH.
        path = "netcoredbg",
      },
    })

    vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticError", linehl = "", numhl = "" })
  end,
}
