-- HTML filetype plugin - applies to both HTML and Django templates

-- If the file contains Django template tags, treat it as a Django file
local content = vim.fn.join(vim.fn.readfile(vim.fn.expand("%")), "\n")
if string.find(content, "{%") or string.find(content, "{{") then
  vim.bo.filetype = "html"
  -- Ensure djlint is used for formatting
  vim.b.conform_formatters = { "djlint" }
end
