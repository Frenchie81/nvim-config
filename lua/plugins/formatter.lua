return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      cs = { "csharpier" },
    },
    format_on_save = {
      timeout_ms = 5000,
      lsp_fallback = true,
    },
  },
}
