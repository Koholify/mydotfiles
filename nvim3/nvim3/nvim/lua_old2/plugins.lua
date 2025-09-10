local vim = vim
local function bootstrap_pckr()
	local pk_path = vim.fn.stdpath("data") .. "/pckr/pckr.nvim"
	if not vim.uv.fs_stat(pk_path) then
		vim.fn.system({
			'git',
			'clone',
			'--filter=blob:none',
			'https://github.com/lewis6991/pckr.nvim',
			pk_path
		})
	end

	vim.opt.rtp:prepend(pk_path)
end

bootstrap_pckr()

require('pckr').add{
	'neovim/nvim-lspconfig',
	'hrsh7th/nvim-cmp',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-path',
	'hrsh7th/cmp-cmdline',
	'hrsh7th/cmp-nvim-lsp',
	'nvim-lua/plenary.nvim',
	'Shatur/neovim-tasks',
	{
		'nvim-telescope/telescope.nvim', branch = '0.1.x',
	},
}
