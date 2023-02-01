-- This file can be loaded by calling `lua require('plugins')` from your init.vim
--

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use {'neoclide/coc.nvim', branch = 'release'}
	use 'nvim-lualine/lualine.nvim'
	use 'toupeira/vim-desertink'
	use 'dikiaap/minimalist'

	--use 'jackguo380/vim-lsp-cxx-highlight'
	use 'sheerun/vim-polyglot'
	use 'nvim-tree/nvim-web-devicons'

	use 'akinsho/toggleterm.nvim'
	use {'nvim-tree/nvim-tree.lua',
		requires = {'nvim-tree/nvim-web-devicons', -- optional, for file icons},
			tag = 'nightly' -- optional, updated every week. (see issue #1193)
		}
	}

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
end)
