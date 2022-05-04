local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  vim.notify("lspconfig require failed")
  return
end

require "plugins.configs.lsp.lsp-installer"
require("plugins.configs.lsp.handlers").setup()
require "plugins.configs.lsp.null-ls"
