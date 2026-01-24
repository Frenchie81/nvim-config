return {
  "rachartier/tiny-code-action.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim" },

    -- optional picker via telescope
    { "nvim-telescope/telescope.nvim" },
  },
  event = "LspAttach",
  config = function()
    local tiny = require("tiny-code-action")

    tiny.setup({ picker = "telescope" })

    vim.keymap.set({ "n", "v" }, "<leader>ca", tiny.code_action)
  end,
}
