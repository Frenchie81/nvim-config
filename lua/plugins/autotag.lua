return {
  "windwp/nvim-ts-autotag",
  ft = {
    "html",
    "javascript",
    "typescript",
    "javascriptreact",
    "typescriptreact",
    "svelte",
    "vue",
    "tsx",
    "jsx",
    "rescript",
    "xml",
    "php",
    "markdown",
    "astro",
    "glimmer",
    "handlebars",
    "hbs",
    "cshtml",
    "razor",
  },
  requires = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("nvim-ts-autotag").setup({
      aliases = {
        ["razor"] = "html",
      },
    })
  end,
}
