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
	if type(cmd) == "string" or type(cmd) == "table" then
		Projective.compile_command = cmd
	else
		Projective.compile_command = Projective.command
	end

	if type(cmd) == "string" then
		vim.cmd("set makeprg=" .. string.gsub(Projective.compile_command, " ", "\\ "))
	elseif type(cmd) == "table" then
		vim.cmd("set makeprg=" .. table.concat(Projective.compile_command, "\\ "))
	end

	vim.print({cd = Projective.root_dir, cmd = Projective.compile_command})
end

Projective.compile = function()
	if Projective.root_dir then
		vim.api.nvim_set_current_dir(Projective.root_dir)
		vim.cmd[[:make]]
	else
		vim.print("Projective Workspace Not Enabled")
	end
end

Projective.run = function(f)
	if f and #f > 0 then
		if type(f) == "string" then
			f = { f }
		end

		Projective.run_target = f
	end
	vim.cmd(":!" .. table.concat(Projective.run_target, " "))
end

Projective.set_target = function(exe)
	Projective.run_target = exe
end

return Projective
