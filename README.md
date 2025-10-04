# Neovim Configuration Summary

This repository contains a Neovim configuration tailored for a productive development workflow. It is built around a collection of plugins that enhance functionality for coding, debugging, and general text editing.

## File Structure

The configuration is organized as follows:

- `init.lua`: The main entry point for the Neovim configuration.
- `lua/`: Contains all the Lua-based configuration files.
- `lua/plugins/`: Each file in this directory configures a specific Neovim plugin.

## Plugins

This configuration uses the following plugins:

- **[akinsho/bufferline.nvim](https://github.com/akinsho/bufferline.nvim):** Provides a stylish and functional buffer line at the top of the editor.
- **[hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp):** A completion engine that suggests code as you type. It's configured with sources for LSP, snippets, buffer, and path completions.
- **[mfussenegger/nvim-dap](https://github.com/mfussenegger/nvim-dap):** A debug adapter protocol client for debugging code within Neovim. It's configured for debugging .NET applications.
- **[stevearc/dressing.nvim](https://github.com/stevearc/dressing.nvim):** A plugin to improve the UI for `vim.ui.select` and `vim.ui.input`.
- **[stevearc/conform.nvim](https://github.com/stevearc/conform.nvim):** A code formatter that can be configured to format code on save.
- **[MagicDuck/grug-far.nvim](https://github.com/MagicDuck/grug-far.nvim):** A plugin for searching and replacing text across multiple files.
- **[folke/neodev.nvim](https://github.com/folke/neodev.nvim):** Provides development tooling for Neovim plugins.
- **[nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim):** A fast and customizable status line for Neovim.
- **[williamboman/mason.nvim](https://github.com/williamboman/mason.nvim):** A package manager for LSP servers, DAP servers, linters, and formatters.
- **[echasnovski/mini.pairs](https://github.com/echasnovski/mini.pairs):** A plugin for auto-pairing brackets and other characters.
- **[nvim-neotest/neotest](https://github.com/nvim-neotest/neotest):** A framework for running tests in Neovim. It's configured to run .NET tests.
- **[folke/noice.nvim](https://github.com/folke/noice.nvim):** A plugin that improves the Neovim UI by replacing the command line with a more modern interface.
- **[stevearc/oil.nvim](https://github.com/stevearc/oil.nvim):** A file explorer that feels like editing a buffer.
- **[folke/persistence.nvim](https://github.com/folke/persistence.nvim):** A plugin that automatically saves and restores sessions.
- **[MeanderingProgrammer/render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim):** A plugin for rendering markdown documents with concealing, highlighting, and other features.
- **[seblyng/roslyn.nvim](https://github.com/seblyng/roslyn.nvim):** A plugin that provides a Roslyn-based C# language server.
- **[mrcjkb/rustaceanvim](https://github.com/mrcjkb/rustaceanvim):** A plugin for Rust development in Neovim.
- **[folke/sidekick.nvim](https://github.com/folke/sidekick.nvim):** A plugin that provides a side-by-side view for code and its corresponding tests.
- **[nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim):** A fuzzy finder for files, buffers, and more.
- **[catppuccin/nvim](https://github.com/catppuccin/nvim), [folke/tokyonight.nvim](https://github.com/folke/tokyonight.nvim), [rebelot/kanagawa.nvim](https://github.com/rebelot/kanagawa.nvim), [EdenEast/nightfox.nvim](https://github.com/EdenEast/nightfox.nvim), [navarasu/onedark.nvim](https://github.com/navarasu/onedark.nvim), [projekt0n/github-nvim-theme](https://github.com/projekt0n/github-nvim-theme):** A collection of color schemes.
- **[nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter):** A plugin for parsing code and providing better syntax highlighting and indentation.
- **[folke/trouble.nvim](https://github.com/folke/trouble.nvim):** A plugin for displaying diagnostics in a pretty list.
- **[folke/ts-comments.nvim](https://github.com/folke/ts-comments.nvim):** A plugin for creating comments with treesitter.
- **[folke/which-key.nvim](https://github.com/folke/which-key.nvim):** A plugin that displays a popup with possible keybindings.

## Keybindings

This configuration defines several custom keybindings, which are summarized below:

| Keybinding | Description |
|---|---|
| `<leader>db` | Toggle breakpoint |
| `<leader>dc` | Continue |
| `<leader>di` | Step into |
| `<leader>do` | Step over |
| `<leader>dO` | Step out |
| `<leader>dr` | Open REPL |
| `<leader>dl` | Run last |
| `<leader>du` | Toggle DAP UI |
| `<F5>` | Continue |
| `<F9>` | Toggle breakpoint |
| `<F10>` | Step over |
| `<F11>` | Step into |
| `<leader>e` | Open diagnostic float |
| `[d` | Go to previous diagnostic |
| `]d` | Go to next diagnostic |
| `gD` | Go to declaration |
| `gd` | Go to definition |
| `K` | Hover |
| `gi` | Go to implementation |
| `<C-k>` | Signature help |
| `<leader>wa` | Add workspace folder |
| `<leader>wr` | Remove workspace folder |
| `<leader>wl` | List workspace folders |
| `<leader>D` | Go to type definition |
| `<leader>rn` | Rename |
| `<leader>cr` | Rename |
| `<leader>ca` | Code action |
| `gr` | Find references |
| `<leader>f` | Format |
| `<leader>tt` | Run all tests in file |
| `<leader>tr` | Run nearest test |
| `<leader>tl` | Run last test |
| `<leader>td` | Debug nearest test |
| `<leader>to` | Toggle test summary |
| `<leader>ti` | Toggle test output |
| `-` | Open parent directory in oil |
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | Find buffers |
| `<leader>fh` | Help tags |
| `<leader>ss` | Search Treesitter Symbols |
| `<leader>sd` | Search Diagnostics |
| `<leader>xx` | Toggle diagnostics (Trouble) |
| `<leader>xX` | Toggle buffer diagnostics (Trouble) |
| `<leader>sr` | Search and replace |
| `<tab>` | Goto/Apply Next Edit Suggestion |
| `<c-a>` | Sidekick Switch Focus |
| `<leader>aa` | Sidekick Toggle CLI |
| `<leader>ac` | Sidekick Copilot Toggle |
| `<leader>ag` | Sidekick Gemini Toggle |
| `<leader>ap` | Sidekick Ask Prompt |
