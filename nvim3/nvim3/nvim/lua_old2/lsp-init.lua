local lsp = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

lsp['clangd'].setup {
	capabilities = capabilities,
	cmd = {
		'clangd',
		'-j=8',
		'--clang-tidy',
		'--header-insertion=never',
	},
}

lsp['lua_ls'].setup {
	capabilities = capabilities,
}
