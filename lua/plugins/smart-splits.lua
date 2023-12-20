return {
  "mrjones2014/smart-splits.nvim",
  config = function()
    local splits = require("smart-splits")
    local keymap = vim.keymap

    -- not specific to smart-splits but I create these bindings just to keep them together
    keymap.set("n", "<leader>sv", "<cmd>vsplit<CR>")
    keymap.set("n", "<leader>sh", "<cmd>split<CR>")

    -- resizing
    keymap.set("n", "<A-h>", splits.resize_left)
    keymap.set("n", "<A-j>", splits.resize_down)
    keymap.set("n", "<A-k>", splits.resize_up)
    keymap.set("n", "<A-l>", splits.resize_right)

    -- moving
    keymap.set("n", "<leader><leader>h", splits.move_cursor_left)
    keymap.set("n", "<leader><leader>j", splits.move_cursor_down)
    keymap.set("n", "<leader><leader>k", splits.move_cursor_up)
    keymap.set("n", "<leader><leader>l", splits.move_cursor_right)
  end
}
