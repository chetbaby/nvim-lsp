local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	print("nvim-lspconfig is not installed")
	return
end

require("config/lsp-installer")
require("config/lsp-handlers").setup()
require "config/null-ls"
