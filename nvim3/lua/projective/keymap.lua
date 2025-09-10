local P = require("projective.core")

vim.keymap.set('n', '<leader>pe', P.enable)
vim.keymap.set('n', '<leader>pc', P.compile)
vim.keymap.set('n', '<leader>px', P.run)
vim.keymap.set('n', '<leader>pt', P.set_target)

vim.api.nvim_create_user_command('ProjectiveEnable', function(t)
	if t.nargs > 0 then P.enable(t.args)
	else P.enable() end end, {})
vim.api.nvim_create_user_command('ProjectiveCompile', function() P.compile() end, {})
vim.api.nvim_create_user_command('ProjectiveRun', function(t) P.run(t.args) end, {})
vim.api.nvim_create_user_command('ProjectiveSetTarget', function(t) P.run(t.args) end, {})
