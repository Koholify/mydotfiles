if Projective then
	return Projective
end

Projective = {}

Projective.root_dir_identifiers = {
	'.git',
	'.editorconfig',
	'README.md',
	'Makefile',
	'CMakeLists.txt',
}

Projective.command = {
	'cmake',
	'--build',
	'build',
}

Projective.run_target = {
	'./a.out',
}

Projective.root_dir = nil
Projective.compile_command = nil

Projective.setup = function(tbl)
	tbl = tbl or {}
	Projective.root_dir_identifiers = tbl.root or Projective.root_dir_identifiers
	Projective.command = tbl.cmd or Projective.command

	require("projective.keymap")
end

Projective.get_root = function()
	if false and vim.lsp.buf_is_attached then
		return vim.lsp.get_clients()[1].config.root_dir
	else
		local root = vim.fs.root(0, Projective.root_dir_identifiers);
		if
			root then return root
		else
			return vim.fn.getcwd(0)
		end
	end
end

Projective.enable = function(cmd)
	Projective.root_dir = Projective.get_root()
	if not Projective.root_dir then
		vim.print("Root Directory Not Found, abort")
		return
	end

	vim.api.nvim_set_current_dir(Projective.root_dir)
	Projective.compile_command = cmd or Projective.command
	vim.cmd("set makeprg=" .. table.concat(Projective.command, "\\ "))
end

Projective.compile = function()
	vim.cmd[[:make]]
end

Projective.run = function(f)
	Projective.run_target = f or Projective.run_target
	vim.cmd(":!" .. Projective.run_target)
end

Projective.set_target = function(exe)
	Projective.run_target = exe
end

return Projective
