return {
  "williamboman/mason.nvim",
  event = "VeryLazy",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")

    mason.setup({
      ensure_installed = { "netcoredbg", "prettierd", "csharpier", "stylua" },
      registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry",
      },
    })

    mason_lspconfig.setup({
      ensure_installed = {
        "lua_ls",
        "copilot",
        "tailwindcss",
        "rust_analyzer",
      },
      handlers = {
        function(server_name)
          require("lspconfig")[server_name].setup({})
        end,
        copilot = function()
          require("lspconfig").copilot.setup({
            enabled = true,
          })
        end,
      },
    })
  end,
}
