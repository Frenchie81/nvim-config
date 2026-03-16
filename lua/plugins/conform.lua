return {
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        cs = { "csharpier" },
        css = { "prettier" },
        js = { "prettier" },
        ts = { "prettier" },
        json = { "prettier" },
        html = { "prettier" },
        rust = { "rustfmt" },
      },
      format_on_save = {
        timeout_ms = 3000,
      },
    })
  end,
}
