return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    "simrat39/rust-tools.nvim",
    "jmederosalvarado/roslyn.nvim",
    "Decodetalkers/csharpls-extended-lsp.nvim",
  },
  config = function()
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local keymap = vim.keymap

    local opts = { noremap = true, silent = true }
    local on_attach = function(_, bufnr)
      opts.buffer = bufnr

      opts.desc = "Show LSP references"
      keymap.set("n", "<leader>R", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

      opts.desc = "Go to declaration"
      keymap.set("n", "<leader>D", vim.lsp.buf.declaration, opts) -- go to declartion

      opts.desc = "Show LSP definitions"
      keymap.set("n", "<leader>d", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

      opts.desc = "Show LSP implementations"
      keymap.set("n", "<leader>i", "<cmd>Telescope lsp_implementations<CR>", opts) -- show implementations

      opts.desc = "Show LSP type definitions"
      keymap.set("n", "<leader>t", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show type defs

      opts.desc = "See available code actions"
      keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions

      opts.desc = "Smart rename"
      keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

      opts.desc = "Show buffer diagnostics"
      keymap.set("n", "<leader>tD", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show diagnostics for file

      opts.desc = "Show line diagnostics"
      keymap.set("n", "<leader>td", vim.diagnostic.open_float, opts)

      opts.desc = "Go to previous diagnostic"
      keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

      opts.desc = "Go to next diagnostic"
      keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

      opts.desc = "Show documentation for what is under the cursor"
      keymap.set("n", "K", vim.lsp.buf.hover, opts)

      opts.desc = "Restart LSP"
      keymap.set("n", "<leader>rs", "<cmd>LspRestart<CR>", opts)
    end

    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Change the Diagnostic symbols in the sign column (gutter)
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    lspconfig["html"].setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })

    lspconfig["cssls"].setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })

    lspconfig["lua_ls"].setup({
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
        },
      },
    })

    local csharpls_extended = require("csharpls_extended")
    lspconfig["csharp_ls"].setup({
      handlers = {
        ["textDocument/definition"] = csharpls_extended.handler,
        ["textDocument/typeDefinition"] = csharpls_extended.handler,
      },
      on_attach = on_attach,
      capabilities = capabilities,
    })

    require("rust-tools").setup({
      server = {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          ["rust-analyzer"] = {
            cargo = {
              allFeatures = true,
            }
          }
        }
      },
    })

    lspconfig["terraformls"].setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })

  end,
}
