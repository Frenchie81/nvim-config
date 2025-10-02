return {
  "MagicDuck/grug-far.nvim",
  keys = {
    {
      "<leader>sr",
      function()
        require("grug-far").grug_far()
      end,
      desc = "Search and replace",
    },
  },
}
