# Neovim Configuration

A modern, fast, and feature-complete Neovim configuration built with [lazy.nvim](https://github.com/folke/lazy.nvim). Specially tailored for productive full-stack and backend development with first-class support for **C# / .NET**, **Rust**, **TypeScript / JavaScript**, **SQL / Databases**, **REST APIs**, and **AI-assisted CLI workflows**.

---

## Highlights

- **Fast Completion & Editing:** Powered by [blink.cmp](https://github.com/saghen/blink.cmp) with Rust-powered fuzzy matching and [blink.pairs](https://github.com/saghen/blink.pairs) for automatic pairing and motion wrapping.
- **First-Class C# / .NET:** Integrated [roslyn.nvim](https://github.com/seblyng/roslyn.nvim) language server, [csharpier](https://github.com/belav/csharpier) format-on-save, [nvim-dap-cs](https://github.com/nicholasmata/nvim-dap-cs) with `netcoredbg`, Razor support (`.razor`, `.cshtml`), and [neotest-vstest](https://github.com/nsidorenco/neotest-vstest).
- **Rust Toolchain:** Deep Rust integration via [rustaceanvim](https://github.com/mrcjkb/rustaceanvim), rust-analyzer, `rustfmt`, and test runner integration.
- **AI CLI Companion:** Integrated [sidekick.nvim](https://github.com/folke/sidekick.nvim) supporting Gemini CLI, Copilot CLI, Claude, and Next Edit Suggestions (`<tab>`).
- **Modern Diagnostics & UI:** Inline curved diagnostics with [tiny-inline-diagnostic.nvim](https://github.com/rachartier/tiny-inline-diagnostic.nvim), smooth cursor animations with [smear-cursor.nvim](https://github.com/sphamba/smear-cursor.nvim), smooth scrolling with [neoscroll.nvim](https://github.com/karb94/neoscroll.nvim), and the clean [vscode.nvim](https://github.com/Mofiqul/vscode.nvim) Dark theme.
- **Built-in REST & Database Tools:** In-editor HTTP client with [kulala.nvim](https://github.com/mistweaverco/kulala.nvim) and full SQL database management with [vim-dadbod-ui](https://github.com/kristijanhusak/vim-dadbod-ui).

---

## File Structure

```text
├── .gitignore
├── .stylua.toml
├── README.md
├── init.lua                   # Core options, keymaps, autocommands, and lazy.nvim bootstrap
└── lua/
    └── plugins/               # Modular plugin specifications (lazy-loaded)
        ├── blink-pairs.lua            # Autopairs and pair highlighting
        ├── blink.lua                  # Fast completion engine & friendly-snippets
        ├── bufferline.lua             # Top tab/buffer line
        ├── conform.lua                # Code formatting on save
        ├── dadbod.lua                 # Database UI & SQL autocompletion
        ├── dap.lua                    # Debug Adapter Protocol & C#/.NET debugging
        ├── grug-far.lua               # Multi-file search and replace
        ├── kulala.lua                 # REST API / HTTP client
        ├── lualine.lua                # Statusline
        ├── mason-lspconfig.lua        # Mason LSP bridge
        ├── mason-tool-installer.lua   # Automatic Mason package installation
        ├── mason.lua                  # Mason package manager & registries
        ├── neo-test.lua               # Test runner (.NET VSTest & Rust)
        ├── neoscroll.lua              # Smooth scrolling
        ├── oil.lua                    # Buffer-like file explorer
        ├── persistence.lua            # Session persistence & restoration
        ├── render-markdown.lua        # In-buffer Markdown preview enhancements
        ├── roslyn.lua                 # Roslyn C# language server
        ├── rustaceanvim.lua           # Rust language and toolchain support
        ├── sidekick.lua               # AI CLI integration (Gemini, Copilot, NES)
        ├── smear-cursor.lua           # Animated cursor trails
        ├── telescope.lua              # Fuzzy finder & pickers
        ├── theme.lua                  # VSCode Dark colorscheme
        ├── tiny-inline-diagnostic.lua # Unobtrusive inline diagnostics display
        ├── treesitter.lua             # Treesitter parsers & syntax highlighting
        └── which-key.lua              # Keymap cheat sheet popup (Helix preset)
```

---

## Installed Plugins

### Completion & Editing
- **[saghen/blink.cmp](https://github.com/saghen/blink.cmp)** – High-performance completion engine using Rust-based fuzzy matching.
- **[rafamadriz/friendly-snippets](https://github.com/rafamadriz/friendly-snippets)** – Broad set of community snippets for `blink.cmp`.
- **[saghen/blink.pairs](https://github.com/saghen/blink.pairs)** – Intelligent autopairs, rainbow highlighting, and pair-wrapping motions.
- **[stevearc/conform.nvim](https://github.com/stevearc/conform.nvim)** – Fast formatter runner with autoformat on save.
- **[MagicDuck/grug-far.nvim](https://github.com/MagicDuck/grug-far.nvim)** – Fast search and replace across the workspace.

### Language Support, LSP & Formatting
- **[williamboman/mason.nvim](https://github.com/williamboman/mason.nvim)** – Portable package manager for LSPs, DAP servers, linters, and formatters.
- **[WhoIsSethDaniel/mason-tool-installer.nvim](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim)** – Automatically manages installations of `csharpier`, `netcoredbg`, `prettier`, `roslyn`, `stylua`, `tree-sitter-cli`, and `terraform`.
- **[williamboman/mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)** – Automatically configures installed language servers (`lua_ls`, `html`, `terraformls`).
- **[seblyng/roslyn.nvim](https://github.com/seblyng/roslyn.nvim)** – Microsoft Roslyn C# language server integration.
- **[mrcjkb/rustaceanvim](https://github.com/mrcjkb/rustaceanvim)** – Full-featured Rust companion (Rust Analyzer, DAP, Neotest).
- **[nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)** – Advanced syntax highlighting, indentation, and code navigation.

### Debugging & Testing
- **[mfussenegger/nvim-dap](https://github.com/mfussenegger/nvim-dap)** – Debug Adapter Protocol client.
- **[rcarriga/nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)** & **[nvim-neotest/nvim-nio](https://github.com/nvim-neotest/nvim-nio)** – Rich UI for DAP sessions.
- **[theHamsta/nvim-dap-virtual-text](https://github.com/theHamsta/nvim-dap-virtual-text)** – Inline variable values during debugging.
- **[nicholasmata/nvim-dap-cs](https://github.com/nicholasmata/nvim-dap-cs)** – C# / .NET coreclr debugging integration with `netcoredbg`.
- **[nvim-neotest/neotest](https://github.com/nvim-neotest/neotest)** – Extensible test runner framework.
- **[nsidorenco/neotest-vstest](https://github.com/nsidorenco/neotest-vstest)** – VSTest adapter for running and debugging .NET tests.

### AI Assistance
- **[folke/sidekick.nvim](https://github.com/folke/sidekick.nvim)** – AI CLI companion tool integrating terminal-based LLMs (Gemini CLI, Copilot CLI) and Next Edit Suggestions (NES).

### Database & HTTP Client
- **[kristijanhusak/vim-dadbod-ui](https://github.com/kristijanhusak/vim-dadbod-ui)** – Simple, powerful database browser UI.
- **[tpope/vim-dadbod](https://github.com/tpope/vim-dadbod)** – Modern database connection layer.
- **[kristijanhusak/vim-dadbod-completion](https://github.com/kristijanhusak/vim-dadbod-completion)** – Autocompletion for SQL queries in buffer.
- **[mistweaverco/kulala.nvim](https://github.com/mistweaverco/kulala.nvim)** – Minimalist in-editor REST/HTTP client.

### Navigation & UI
- **[stevearc/oil.nvim](https://github.com/stevearc/oil.nvim)** – File system management in an ordinary Neovim buffer.
- **[nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)** – Highly extensible fuzzy finder.
- **[akinsho/bufferline.nvim](https://github.com/akinsho/bufferline.nvim)** – Top tab bar with buffer navigation and pickers.
- **[nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)** – Fast and responsive statusline.
- **[folke/persistence.nvim](https://github.com/folke/persistence.nvim)** – Automatic session saving and loading.
- **[folke/which-key.nvim](https://github.com/folke/which-key.nvim)** – Visual popup displaying available keybindings.
- **[Mofiqul/vscode.nvim](https://github.com/Mofiqul/vscode.nvim)** – Dark theme matching Visual Studio Code.
- **[rachartier/tiny-inline-diagnostic.nvim](https://github.com/rachartier/tiny-inline-diagnostic.nvim)** – Clean, multi-line inline diagnostics.
- **[karb94/neoscroll.nvim](https://github.com/karb94/neoscroll.nvim)** – Smooth, customizable viewport scrolling.
- **[sphamba/smear-cursor.nvim](https://github.com/sphamba/smear-cursor.nvim)** – Fluid animated cursor trailing effects.
- **[MeanderingProgrammer/render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim)** – Render markdown tables, callouts, and symbols inside buffers.

---

## Keybindings Reference

The leader key is configured to `<Space>`.

### General & Editor

| Keybinding | Mode | Description |
|---|---|---|
| `jj` | Insert | Escape insert mode |
| `<C-s>` | Normal | Save current buffer |
| `<leader>qq` | Normal | Quit all windows (`qa`) |
| `<Esc>` | Normal | Clear search highlight (`nohlsearch`) |
| `<leader>l` | Normal | Open Lazy plugin manager |
| `<leader>rr` | Normal | Restart LSP server (`:lsp restart`) |
| `<leader>sm` | Normal | Show `:messages` history in a vertical split buffer |
| `<leader>ym` | Normal | Copy `:messages` to system clipboard |
| `<leader>?` | Normal | Show buffer-local keymaps (`which-key`) |

### Buffer Management (`bufferline.nvim`)

| Keybinding | Mode | Description |
|---|---|---|
| `<S-l>` | Normal | Next buffer |
| `<S-h>` | Normal | Previous buffer |
| `<leader>bd` | Normal | Close current buffer (safely keeps window layout) |
| `<leader>bo` | Normal | Close all other buffers |
| `<leader>bl` | Normal | Close buffers to the left |
| `<leader>br` | Normal | Close buffers to the right |
| `<leader>bp` | Normal | Pick buffer to switch to |
| `<leader>bc` | Normal | Pick buffer to close |

### Window Management & Navigation

| Keybinding | Mode | Description |
|---|---|---|
| `<C-h>` | Normal | Move to left window |
| `<C-j>` | Normal | Move to lower window |
| `<C-k>` | Normal | Move to upper window |
| `<C-l>` | Normal | Move to right window |
| `<leader>sl` | Normal | Split window right (`:vsplit`) |
| `<leader>sh` | Normal | Split window left (`:leftabove vsplit`) |
| `<leader>sj` | Normal | Split window below (`:split`) |
| `<leader>sk` | Normal | Split window above (`:topleft split`) |
| `<leader>wd` | Normal | Close current window |
| `<C-Up>` | Normal | Increase window height (+2) |
| `<C-Down>` | Normal | Decrease window height (-2) |
| `<C-Left>` | Normal | Decrease window width (-2) |
| `<C-Right>` | Normal | Increase window width (+2) |

### Search & Navigation (`telescope.nvim`, `oil.nvim`, `grug-far.nvim`)

| Keybinding | Mode | Description |
|---|---|---|
| `-` | Normal | Open parent directory in Oil file manager |
| `<leader>ff` | Normal | Find files |
| `<leader>fg` | Normal | Live grep search |
| `<leader>fG` | Normal | Find Git files |
| `<leader>gs` | Normal | View Git status |
| `<leader>fb` | Normal | Find open buffers |
| `<leader>fh` | Normal | Search help tags |
| `<leader>ss` | Normal | Search Treesitter symbols |
| `<leader>sd` | Normal | Search diagnostics |
| `<leader>sr` | Normal | Workspace search and replace (`grug-far`) |
| `<C-f>` | Telescope Insert | Send results to quickfix list and open it |

### LSP & Code Intelligence

| Keybinding | Mode | Description |
|---|---|---|
| `gd` | Normal | Go to definition |
| `gD` | Normal | Go to declaration |
| `gi` | Normal | Go to implementation |
| `gr` | Normal | Find symbol references (via Telescope) |
| `<leader>cr` | Normal | Rename symbol |
| `<leader>ca` | Normal, Visual | Trigger code actions |

*Note: Formatting is handled automatically on save via `conform.nvim` (supporting Lua, C#, CSS, JS, TS, JSON, HTML, and Rust).*

### Testing (`neotest`)

| Keybinding | Mode | Description |
|---|---|---|
| `<leader>tt` | Normal | Run all tests in the current file |
| `<leader>tr` | Normal | Run the nearest test |
| `<leader>tl` | Normal | Re-run the last test |
| `<leader>td` | Normal | Debug nearest test (via DAP) |
| `<leader>to` | Normal | Toggle test summary panel |
| `<leader>ti` | Normal | Toggle test output panel |

### Debugging (`nvim-dap`)

| Keybinding | Mode | Description |
|---|---|---|
| `<leader>db` / `<F9>` | Normal | Toggle breakpoint |
| `<leader>dc` / `<F5>` | Normal | Start / continue debugging |
| `<leader>di` / `<F11>` | Normal | Step into |
| `<leader>do` / `<F10>` | Normal | Step over |
| `<leader>dO` | Normal | Step out |
| `<leader>dr` | Normal | Open debug REPL |
| `<leader>dl` | Normal | Re-run last debug configuration |
| `<leader>du` | Normal | Toggle DAP UI |

### AI CLI Integration (`sidekick.nvim`)

| Keybinding | Mode | Description |
|---|---|---|
| `<tab>` | Normal, Insert | Jump to or apply Next Edit Suggestion (NES) |
| `<C-.>` | Normal, Terminal, Insert, Visual | Toggle Sidekick CLI |
| `<C-a>` | Normal, Terminal, Insert, Visual | Switch focus to Sidekick CLI |
| `<leader>aa` | Normal | Toggle Sidekick CLI window |
| `<leader>as` | Normal | Select from installed AI CLIs |
| `<leader>ad` | Normal | Detach current CLI session |
| `<leader>at` | Normal, Visual | Send current context `{this}` to CLI |
| `<leader>af` | Normal | Send entire buffer `{file}` to CLI |
| `<leader>av` | Visual | Send active visual selection `{selection}` to CLI |
| `<leader>ap` | Normal, Visual | Open Sidekick prompt picker |
| `<leader>ac` | Normal | Toggle Copilot CLI |
| `<leader>ag` | Normal | Toggle Gemini CLI |

### REST Client (`kulala.nvim`)

Active in `.http` and `.rest` files:

| Keybinding | Mode | Description |
|---|---|---|
| `<leader>hs` | Normal | Send HTTP request at cursor |
| `<leader>ha` | Normal | Send all HTTP requests in buffer |
| `<leader>hb` | Normal | Open scratchpad |
| `<leader>he` | Normal | Select active environment |

### Database Management (`vim-dadbod-ui`)

Access database features via Vim commands:

| Command | Description |
|---|---|
| `:DBUI` | Open Database UI |
| `:DBUIToggle` | Toggle Database UI drawer |
| `:DBUIAddConnection` | Add a new database connection string |
| `:DBUIFindBuffer` | Locate active database buffer |

### Session Persistence (`persistence.nvim`)

| Keybinding | Mode | Description |
|---|---|---|
| `<leader>qs` | Normal | Restore last session for current directory |
| `<leader>ql` | Normal | Restore last session across directories |
| `<leader>qd` | Normal | Do not save current session on exit |
