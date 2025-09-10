
local function on_attach(bufnr)
	local api = require('nvim-tree.api')
	local function opts(desc)
		return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	api.config.mappings.default_on_attach(bufnr)
	vim.keymap.set('n', '<CR>',  function() api.node.open.replace_tree_buffer() end, opts('Open'))
	vim.keymap.set('n', 'o',  function() api.node.open.replace_tree_buffer() end, opts('Open'))
end

return {
	{ 'nvim-tree/nvim-web-devicons' },
	{
		'nvim-tree/nvim-tree.lua',
		lazy = false,
		keys = {
			{ '<leader>ff', nil, desc = 'Open file tree' },
			{ '<leader>fc', nil, desc = 'Close file tree' },
		},
		config = function()
			require('nvim-tree').setup({ on_attach = on_attach })
			local api = require('nvim-tree.api')
			vim.keymap.set('n', '<leader>ff', function() api.tree.open({current_window = true, find_file = true}) end, {desc = 'Open file tree'})
			vim.keymap.set('n', '<leader>fc', api.tree.close, {desc = 'Close file tree'} )
		end,
	},
}
