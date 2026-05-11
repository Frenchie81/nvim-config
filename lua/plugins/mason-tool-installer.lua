return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  dependencies = {
    "mason-org/mason.nvim",
  },
  config = function()
    local roslyn = { "roslyn", version = "5.4.0-2.26175.10" }
    if vim.fn.has("win32") == 1 then
      roslyn = { "roslyn" }
    end

    require("mason-tool-installer").setup({
      ensure_installed = {
        "csharpier",
        "netcoredbg",
        "prettier",
        roslyn,
        "stylua",
        "tree-sitter-cli",
        "terraform",
      },
    })
  end,
}
