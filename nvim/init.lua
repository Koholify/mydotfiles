vim = vim

require('lualine').setup()
require('toggleterm').setup()
require('mappings')
require('plugins')
require('coc')
require('tree')

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

vim.cmd 'colorscheme desertink'
