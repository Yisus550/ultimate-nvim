local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    css = { "prettier" },
    html = { "prettier" },
    json = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },
    graphql = { "prettier" },
    lua = { "stylua" },
    python = { "isort", "black" },
    -- ruby = { "rubocop" }, -- Requires Ruby gem: gem install rubocop
  },
  -- Format on save
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
})

-- Optional: Add a keymap to format manually
vim.keymap.set({ "n", "v" }, "<leader>mf", function()
  conform.format({
    lsp_fallback = true,
    async = false,
    timeout_ms = 300,
  })
end, { desc = "Format file or range (in visual mode)" })
