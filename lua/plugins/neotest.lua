return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nsidorenco/neotest-vstest",
  },
  keys = {
    {
      "<leader>tt",
      function()
        require("neotest").run.run()
      end,
      desc = "Run all tests in file",
    },
    {
      "<leader>tr",
      function()
        require("neotest").run.run()
      end,
      desc = "Run nearest test",
    },
    {
      "<leader>tl",
      function()
        require("neotest").run.run_last()
      end,
      desc = "Run last test",
    },
    {
      "<leader>td",
      function()
        require("neotest").run.run({ strategy = "dap" })
      end,
      desc = "Debug nearest test",
    },
    {
      "<leader>to",
      function()
        require("neotest").summary.toggle()
      end,
      desc = "Toggle test summary",
    },
    {
      "<leader>ti",
      function()
        for _, win in ipairs(vim.api.nvim_list_wins()) do
          if vim.bo[vim.api.nvim_win_get_buf(win)].filetype == "neotest-output" then
            vim.api.nvim_win_close(win, false)
            return
          end
        end
        require("neotest").output.open({ enter = true })
      end,
      desc = "Toggle test output",
    },
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-vstest")({
          dap_settings = {
            type = "coreclr",
            request = "launch",
            name = "dap-cs-test",
          },
        }),
      },
    })
  end,
}
