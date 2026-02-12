-- ruby_lsp configuration
-- Disable built-in formatter to use conform.nvim with Rubocop instead
return {
  init_options = {
    formatter = "none", -- Disable ruby_lsp's formatter, let conform.nvim handle it
  },
  settings = {
    rubyLsp = {
      enabledFeatures = {
        -- LSP features (keep enabled)
        codeActions = true,
        diagnostics = true,
        documentHighlights = true,
        documentLink = true,
        documentSymbols = true,
        foldingRanges = true,
        formatting = false, -- Disable formatting from ruby_lsp
        hover = true,
        inlayHint = true,
        onTypeFormatting = false,
        selectionRanges = true,
        semanticHighlighting = true,
        completion = true,
        codeLens = true,
        definition = true,
        workspaceSymbol = true,
        signatureHelp = true,
        typeHierarchy = true,
      },
    },
  },
}
