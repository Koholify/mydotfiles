return {
	{
		"folke/which-key.nvim",
		lazy = false,
		opts = {},
		keys = {
			{'<leader>?', function() require"which-key".show({global=true}) end},
		},
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		-- priority = 1000,
		-- config = function()
		-- 	vim.cmd([[colorscheme tokyonight-moon]])
		-- end,
	},
	{
		"navarasu/onedark.nvim",
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require('onedark').setup {
				style = 'deep'
			}
			-- Enable theme
			require('onedark').load()
		end
	}
}
