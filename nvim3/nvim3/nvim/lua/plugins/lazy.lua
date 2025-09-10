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
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme tokyonight-moon]])
		end,
	},
}
