local M = {}

M.get_default_capabilities = function()
  local capabilities = vim.lsp.protocol.make_client_capabilities()

  -- Extend with nvim-cmp capabilities for autocompletion
  local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
  if has_cmp then
    capabilities = vim.tbl_deep_extend("force", capabilities, cmp_nvim_lsp.default_capabilities())
  end

  -- required by nvim-ufo
  capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
  }

  return capabilities
end

return M
