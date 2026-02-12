local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local mason_tool_installer = require("mason-tool-installer")

-- Add Mason's bin directory to PATH
local mason_bin = vim.fn.stdpath("data") .. "/mason/bin"
vim.env.PATH = mason_bin .. ":" .. vim.env.PATH

-- Setup Mason
mason.setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

-- Setup Mason LSPConfig
mason_lspconfig.setup({
  -- Automatically install LSP servers configured in your lsp.lua
  automatic_installation = {
    exclude = { "ts_ls", "tsserver" }, -- Exclude ts_ls, we use vtsls instead
  },
})

-- Auto-install LSP servers, formatters, linters, and debug adapters
mason_tool_installer.setup({
  ensure_installed = {
    -- LSP Servers
    "jdtls", -- Java
    "vtsls", -- TypeScript/JavaScript (better than tsserver)
    "ruby-lsp", -- Ruby (Shopify)
    "gopls", -- Go
    "pyright", -- Python
    "ruff", -- Python linter (replaces deprecated ruff-lsp)
    "lua-language-server", -- Lua
    "bash-language-server", -- Bash
    "yaml-language-server", -- YAML
    "vim-language-server", -- VimScript

    -- Formatters
    "prettier", -- JavaScript/TypeScript/CSS/HTML/JSON/YAML/Markdown
    "stylua", -- Lua
    "black", -- Python
    "isort", -- Python imports
    -- Note: rubocop is not available via Mason, install with: gem install rubocop

    -- Debug Adapters
    "java-debug-adapter", -- Java debugging
    "java-test", -- Java testing
  },
  -- Auto-update installed tools
  auto_update = false,
  -- Run on start
  run_on_start = true,
})
