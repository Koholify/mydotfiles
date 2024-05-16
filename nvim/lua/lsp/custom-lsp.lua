local swift_lsp = vim.api.nvim_create_augroup("swift_lsp", { clear = true })

local handler = require("lsp.handlers")
require("lspconfig")['sourcekit'].setup {
  capabilities = handler.capabilities,
  on_attach = handler.on_attach,
  settings = {},
}
