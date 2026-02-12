-- Java-specific settings
vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4
vim.opt_local.softtabstop = 4
vim.opt_local.expandtab = true
vim.opt_local.colorcolumn = "120"

-- Setup jdtls only if the plugin is loaded
local ok, jdtls_config = pcall(require, "config.jdtls")
if not ok then
  vim.notify("jdtls config not found", vim.log.levels.ERROR)
  return
end

local jdtls = require("jdtls")

-- Get the configuration and start jdtls
local config = jdtls_config.setup()

-- Start or attach to jdtls
jdtls.start_or_attach(config)
