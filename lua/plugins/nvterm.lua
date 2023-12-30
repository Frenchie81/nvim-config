return {
  "NvChad/nvterm",
  config = function()
    local opts = {}
    local os = vim.loop.os_uname().sysname
    if (os == "Windows_NT")
    then
      opts.terminals = { shell = "PowerShell.exe" }
    end
    require("nvterm").setup(opts)
    local terminal = require("nvterm.terminal")

    vim.keymap.set({"n", "t"}, "<A-h>", function() terminal.toggle("horizontal") end)
    vim.keymap.set({"n", "t"}, "<A-v>", function() terminal.toggle("vertical") end)

  end,
}
