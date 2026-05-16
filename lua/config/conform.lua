local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    css = { "prettier" },
    html = { "djlint" },
    django = { "djlint" },
    jinja = { "djlint" },
    json = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },
    graphql = { "prettier" },
    lua = { "stylua" },
    python = { "isort", "black" },
    -- ruby = { "rubocop" }, -- Requires Ruby gem: gem install rubocop
  },
  formatters = {
    djlint = {
      command = "djlint",
      args = { "--reformat", "-" },
      stdin = true,
    },
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
    timeout_ms = 1000,
  })
  vim.notify("Formatting with Conform", vim.log.levels.INFO)
end, { desc = "Format file or range (in visual mode)" })

-- Add command for manual formatting
vim.api.nvim_create_user_command("ConformFormat", function()
  conform.format({
    lsp_fallback = true,
    async = false,
    timeout_ms = 1000,
  })
end, {})
