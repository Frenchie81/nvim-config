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
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-vstest"),
      },
    })
  end,
}
