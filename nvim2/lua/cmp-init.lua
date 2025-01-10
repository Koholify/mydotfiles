local cmp = require('cmp')

cmp.setup({
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-e>'] = cmp.mapping.abort(),

		-- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		['<CR>'] = cmp.mapping.confirm({ select = false }), 
		['<Tab>'] = cmp.mapping.select_next_item(),
		['<S-Tab>'] = cmp.mapping.select_prev_item(),
	}),
	sources = cmp.config.sources({
		{name = 'nvim_lsp'},
		{name = 'buffer'},
		{name = 'path'},
	}),
	formatting = {
		fields = { 'abbr', 'menu' },
		format = function(entry, vim_item)
			vim_item.menu = ({
				buffer = '[Buffer]',
				path = '[Path]',
				nvim_lsp = '[LSP]',
			})[entry.source.name]
			return vim_item
		end,
	},
})

cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{name = 'path'},
		{name = 'cmdline'},
	},
})
