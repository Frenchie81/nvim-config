# AGENTS.md

## Architecture & Source of Truth
- **Entrypoint**: `init.lua` sets `vim.g.mapleader = " "` (must remain before `lazy.nvim`), core options/keymaps/autocmds, and `require("lazy").setup({ spec = { { import = "plugins" } } })`.
- **Auto-discovered plugins**: Every `lua/plugins/*.lua` file returns a `lazy.nvim` spec and is loaded automatically—do not add manual `require("plugins.*")` calls to `init.lua`.
- **Trust Lua over `README.md`**: `README.md` has stale entries (e.g., it references a nonexistent `lua/plugins/roslyn.lua` / `seblyng/roslyn.nvim` and legacy `williamboman/mason*` repos). Verify against `init.lua` and `lua/plugins/*.lua`.
- **Untracked files**: Both `lazy-lock.json` and `.opencode/plans/` are ignored via `.gitignore`.

## Plugin & Toolchain Gotchas
- **LSP (`mason-org/mason-lspconfig.nvim` v2 + Neovim 0.11+)**: Installed servers are enabled automatically via `vim.lsp.enable()`. Do **not** use deprecated `require("lspconfig")[server].setup(...)` or `setup_handlers`; configure overrides with `vim.lsp.config(name, cfg)` (or `lsp/<name>.lua`).
- **Three Mason `ensure_installed` lists use different package ID schemes**:
  - `lua/plugins/mason-lspconfig.lua`: **`nvim-lspconfig` server names** (`lua_ls`, `html`, `cssls`, `jsonls`, `vtsls`, `eslint`, `tailwindcss`, `terraformls`, `roslyn_ls`).
  - `lua/plugins/mason-tool-installer.lua`: **Mason registry package names** (`csharpier`, `netcoredbg`, `prettier`, `prettierd`, `stylua`, `tree-sitter-cli`, `terraform`).
  - `lua/plugins/dap.lua` (`mason-nvim-dap`): **DAP adapter names** (`netcoredbg`).
- **Language LSP exceptions**:
  - **Rust**: `mrcjkb/rustaceanvim` (`lua/plugins/rustaceanvim.lua`, `lazy = false`) manages `rust-analyzer` directly. Never add `rust_analyzer` to `mason-lspconfig` or duplicate LSP clients will attach.
  - **C# / .NET**: Uses `roslyn_ls` via `mason-lspconfig.lua`, `csharpier` via `conform.nvim`, `nvim-dap-cs` + `netcoredbg` in `dap.lua`, and `neotest-vstest` in `neo-test.lua`. `.razor` filetype detection is registered in `init.lua`.
- **`nvim-treesitter` (`main` branch rewrite)**: Tracks the `main` branch, **not** legacy `master`. `require("nvim-treesitter.configs")` does not exist—install parsers with `require("nvim-treesitter").install(parsers)` and start highlighting via the `FileType` autocmd calling `pcall(vim.treesitter.start, args.buf)` in `lua/plugins/treesitter.lua` (compilers: `zig`, `gcc`, `clang`).
- **Formatting (`conform.nvim`)**: Runs on `BufWritePre` (`timeout_ms = 3000`, `lsp_format = "fallback"`) and `<leader>cf`. Keys in `formatters_by_ft` must be exact Neovim `filetype` names (`typescript`, `typescriptreact`, `jsonc`), not file extensions.
- **Keymap & UI constraints**:
  - `blink.cmp` uses `keymap = { preset = "enter" }` so `<Tab>` stays free for `sidekick.nvim` Next Edit Suggestions (`lua/plugins/sidekick.lua`).
  - `tiny-inline-diagnostic.nvim` sets `vim.diagnostic.config({ virtual_text = false })`; do not re-enable built-in `virtual_text` globally.
  - In `lazy.nvim` specs, defining `config = function(_, opts)` disables automatic `setup(opts)`—call `setup(opts)` explicitly inside `config` whenever `opts` is also defined (note: `lua/plugins/blink-pairs.lua` currently defines `config` only to run `download():pwait(60000)`).

## Environment & Style
- **Windows (`win32`) defaults**: `init.lua` sets `vim.opt.shell = "pwsh"` (`-NoProfile -Command`), and `sidekick.nvim` disables `tmux` muxing on Windows.
- **Lua formatting**: Enforced by `.stylua.toml` (`indent_type = "Spaces"`, `indent_width = 2`, `line_endings = "Windows"`). Keep files as CRLF—`line_endings = "Windows"` makes `stylua --check` accept the repo's CRLF working-tree endings (matching `core.autocrlf = true`).

## Verification (PowerShell)
- **Check Lua formatting** (use Mason's binary if `stylua` is not on `PATH`):
  ```powershell
  & "$env:LOCALAPPDATA\nvim-data\mason\bin\stylua.cmd" --check init.lua lua/
  ```
- **Validate startup & eager plugins** (check `v:errmsg`; bare `+qa` exits `0` even on startup errors):
  ```powershell
  nvim --headless "+if v:errmsg != '' | cquit | endif" "+qa"
  ```
- **Validate a lazy-loaded plugin** (`event`/`keys`/`cmd`/`ft` specs do not run `config` on bare startup):
  ```powershell
  nvim --headless "+Lazy load conform.nvim" "+if v:errmsg != '' | cquit | endif" "+qa"
  ```
