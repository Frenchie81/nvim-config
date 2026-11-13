return {
  "stevearc/conform.nvim",
  keys = {
    {
      "<leader>cf",
      function()
        require("conform").format({ async = true, lsp_format = "fallback" })
      end,
      mode = { "n", "v" },
      desc = "Format buffer",
    },
  },
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  config = function()
    local prettier = { "prettierd", "prettier", stop_after_first = true }

    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        cs = { "csharpier" },
        javascript = prettier,
        javascriptreact = prettier,
        typescript = prettier,
        typescriptreact = prettier,
        css = prettier,
        scss = prettier,
        html = prettier,
        json = prettier,
        jsonc = prettier,
        yaml = prettier,
        markdown = prettier,
        rust = { "rustfmt" },
      },
      format_on_save = {
        timeout_ms = 3000,
        lsp_format = "fallback",
      },
    })
  end,
}
