return {
  "mason-org/mason-lspconfig.nvim",
  dependencies = {
    "mason-org/mason.nvim",
    "neovim/nvim-lspconfig",
  },
  config = function()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "html",
        "cssls",
        "jsonls",
        "vtsls",
        "eslint",
        "tailwindcss",
        "terraformls",
        "roslyn_ls",
      },
    })
  end,
}
