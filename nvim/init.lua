local vim = vim

require('lualine').setup()
require('toggleterm').setup()
require('mappings')
require('plugins')
require('tree')
require('cmp-conf')
require("lsp")
require('orgmode').setup({
		org_default_notes_file = '~/org/notes.org',
		org_agenda_files = {'~/org/orgs/*', '~/org/*'},
		org_todo_keywords = {'TODO', 'WAITING', '|', 'DONE', 'DELEGATED'},
		org_todo_keyword_faces = {
			WAITING = ':foreground red :weight bold',
			DELEGATED = ':background #FFFFFF :slant italic :underline on',
			TODO = ':background #000000 :foreground yellow',
		},
		mappings = {
			org = {
				org_toggle_checkbox = "<Leader>oct",
			},
		},
	})

vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.syntax = 'on'
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.conceallevel = 2
vim.opt.concealcursor = 'nc'

vim.cmd 'colorscheme desertink'
