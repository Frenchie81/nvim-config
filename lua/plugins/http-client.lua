return {
  {
    "heilgar/nvim-http-client",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    ft = { "http", "rest" },
    keys = {
      { "<leader>hs", "<cmd>HttpRun<cr>", desc = "Send request" },
      { "<leader>ha", "<cmd>HttpRunAll<cr>", desc = "Send all requests" },
      { "<leader>he", "<cmd>HttpEnv<cr>", desc = "Select environment" },
      { "<leader>hf", "<cmd>HttpEnvFile<cr>", desc = "Select environment file" },
      { "<leader>hx", "<cmd>HttpStop<cr>", desc = "Stop request" },
      { "<leader>hc", "<cmd>HttpCopyCurl<cr>", desc = "Copy curl command" },
      { "<leader>hd", "<cmd>HttpDryRun<cr>", desc = "Dry run request" },
      { "<leader>hv", "<cmd>HttpVerbose<cr>", desc = "Toggle verbose mode" },
    },
    config = function()
      require("http_client").setup({
        split_direction = "right",
        create_keybindings = false,
      })

      if pcall(require, "telescope") then
        require("telescope").load_extension("http_client")
      end
    end,
  },
}
