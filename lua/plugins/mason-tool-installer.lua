return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  dependencies = {
    "mason-org/mason.nvim",
  },
  config = function()
    require("mason-tool-installer").setup({
      ensure_installed = {
        "csharpier",
        "netcoredbg",
        "prettier",
        "roslyn",
        "stylua",
        "tree-sitter-cli",
      },
    })
  end,
}
