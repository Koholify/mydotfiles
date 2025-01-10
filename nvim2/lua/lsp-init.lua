local lsp = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

lsp['clangd'].setup {
	capabilities = capabilities,
}

lsp['lua_ls'].setup {
	capabilities = capabilities,
}
