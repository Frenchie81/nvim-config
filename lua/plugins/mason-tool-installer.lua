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
        { "roslyn", version = "5.4.0-2.26175.10" },
        "stylua",
        "tree-sitter-cli",
        "terraform",
      },
    })
  end,
}
