local format_on_save_enabled = true
return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>cf",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = "n",
      desc = "Format buffer",
    },
    {
      "<leader>uf",
      function()
        format_on_save_enabled = not format_on_save_enabled
        require("conform").setup({
          format_on_save = format_on_save_enabled and {
            timeout_ms = 5000,
            lsp_fallback = true,
          } or nil,
        })
        if format_on_save_enabled then
          print("Conform formatting on save enabled")
        else
          print("Conform formatting on save disabled")
        end
      end,
      mode = "n",
      desc = "Toggle format on save",
    },
  },
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
