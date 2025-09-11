local P = require("projective.core")

vim.keymap.set('n', '<leader>pe', ':ProjectiveEnable', {desc = "Enable Projective"})
vim.keymap.set('n', '<leader>pc', P.compile, {desc = "Compile With Projective"})
vim.keymap.set('n', '<leader>px', ':ProjectiveRun', {desc = "Run Proj From Projective Root"})
vim.keymap.set('n', '<leader>pt', ':ProjectiveSetTarget ', {desc = "Set Target For Projective Run"})

vim.api.nvim_create_user_command('ProjectiveEnable',
	function(t)
		if #t.fargs > 0 then P.enable(t.args)
		else P.enable() end
	end,
	{nargs = "*", complete = "shellcmdline"})
vim.api.nvim_create_user_command('ProjectiveCompile',
	function() P.compile() end,
	{})
vim.api.nvim_create_user_command('ProjectiveRun',
	function(t) P.run(t.args) end,
	{nargs = "*", complete = "shellcmdline"})
vim.api.nvim_create_user_command('ProjectiveSetTarget',
	function(t) if #t.args > 0 then P.set_target(t.args) end end,
	{nargs = "*", complete = "shellcmdline"})
vim.api.nvim_create_user_command('ProjectiveInfo',
	function() vim.print(P) end,
	{})

