-- This file can be loaded by calling `lua require('plugins')` from your init.vim
--

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'nvim-lualine/lualine.nvim'
	use 'toupeira/vim-desertink'
	use 'dikiaap/minimalist'
	use 'sheerun/vim-polyglot'
	use 'nvim-tree/nvim-web-devicons'

	-- LSP
	use 'neovim/nvim-lspconfig'
	use 'williamboman/mason.nvim'
	use 'williamboman/mason-lspconfig.nvim'

	-- Completion
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-nvim-lua'

	use 'saadparwaiz1/cmp_luasnip'
	use 'L3MON4D3/LuaSnip'
	use 'rafamadriz/friendly-snippets'

	use 'akinsho/toggleterm.nvim'
	use {'nvim-tree/nvim-tree.lua',
		requires = {'nvim-tree/nvim-web-devicons', -- optional, for file icons},
			tag = 'nightly' -- optional, updated every week. (see issue #1193)
		}
	}

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use {'nvim-orgmode/orgmode'}
end)
