return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  config = function()
    require("nvim-treesitter.install").compilers = { "zig", "gcc", "clang" }
    local ts = require("nvim-treesitter")
    local parsers = {
      "c_sharp",
      "html",
      "javascript",
      "typescript",
      "tsx",
      "jsdoc",
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
      "http",
    }
    ts.install(parsers)

    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("custom-treesitter-start", { clear = true }),
      pattern = {
        "cs",
        "html",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "json",
        "jsonc",
        "razor",
        "cshtml",
        "rust",
        "css",
        "scss",
        "markdown",
        "terraform",
        "toml",
        "dockerfile",
        "yaml",
        "sql",
        "http",
      },
      callback = function(args)
        pcall(vim.treesitter.start, args.buf)
      end,
    })
  end,
}
