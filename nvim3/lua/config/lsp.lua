vim.lsp.enable('lua_ls')

vim.lsp.config('clangd', {
	cmd = {
		'clangd',
		'-j=4',
		'--clang-tidy',
		'--header-insertion=never',
	}
})
vim.lsp.enable('clangd')

--vim.lsp.enable('ts_ls')

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client and client:supports_method('textDocument/completion') then
			vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'fuzzy', 'popup', 'preview' }
			vim.lsp.completion.enable(true, client.id, ev.buf, {autotrigger = true})
			vim.keymap.set('i', '<C-Space>', function() vim.lsp.completion.get() end)
		end
	end,
})

vim.diagnostic.config({
	virtual_lines = {
		current_line = true,
	},
})

