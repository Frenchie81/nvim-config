return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  config = function()
    local ts = require("nvim-treesitter")
    local parsers = {
      "c_sharp",
      "html",
      "javascript",
      "typescript",
      "rust",
      "css",
      "json",
      "razor",
      "xml",
      "markdown",
      "terraform",
      "toml",
      "dockerfile",
      "yaml",
      "sql",
    }
    ts.install(parsers)

    local ft_to_lang = {
      cs = "c_sharp",
      html = "html",
      javascript = "javascript",
      json = "json",
      razor = "razor",
      cshtml = "razor",
      rust = "rust",
      css = "css",
      typescript = "typescript",
      md = "markdown",
      tf = "terraform",
      toml = "toml",
      dockerfile = "dockerfile",
      yaml = "yaml",
      yml = "yaml",
      sql = "sql",
    }

    for ft, _ in pairs(ft_to_lang) do
      vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
        pattern = "*." .. ft,
        callback = function()
          vim.treesitter.start()
        end,
      })
    end
  end,
}
