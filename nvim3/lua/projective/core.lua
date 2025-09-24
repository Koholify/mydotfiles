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

Projective.setup = function(opts)
	opts = opts or {}
	Projective.root_dir_identifiers = opts.root_markers or Projective.root_dir_identifiers
	Projective.command = opts.cmd or Projective.command
	Projective.run_target = opts.target or Projective.run_target

	if not opts.ignore_keymap then
		require("projective.keymap")
	end
end

Projective.get_root = function()
	if vim.lsp.buf_is_attached then
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

Projective.set_root = function()
	if not (vim.fn.getcwd(0) == Projective.root_dir) then
		vim.print("changing root dir: " .. Projective.root_dir)
		vim.api.nvim_set_current_dir(Projective.root_dir)
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

	if type(Projective.compile_command) == "string" then
		vim.cmd("set makeprg=" .. string.gsub(Projective.compile_command, " ", "\\ "))
	elseif type(Projective.compile_command) == "table" then
		vim.cmd("set makeprg=" .. table.concat(Projective.compile_command, "\\ "))
	end

	vim.print({cd = Projective.root_dir, cmd = Projective.compile_command})
end

Projective.compile = function()
	if Projective.root_dir then
		Projective.set_root()
		vim.cmd[[:make]]
	else
		vim.print("Projective Workspace Not Enabled")
	end
end

Projective.run = function(f)
	Projective.set_target(f)
	Projective.set_root()
	vim.cmd(":!" .. table.concat(Projective.run_target, " "))
end

Projective.set_target = function(f)
	if f and #f > 0 then
		if type(f) == "string" then
			f = vim.split(f, " ", { trimempty = true })
		end

		if type(f) == 'table' then
			Projective.run_target = f
		end
	end
end

Projective.run_async = function(f)
	Projective.set_target(f)

	vim.cmd("vs")
	local buf_num = vim.api.nvim_create_buf(true, true)
	local buf_name = table.concat(Projective.run_target, " ")
	vim.api.nvim_buf_set_name(buf_num, buf_name)
	vim.api.nvim_buf_set_keymap(buf_num, "n", "q", ":bd<cr>", {desc="quit buffer"})
	vim.api.nvim_win_set_buf(vim.api.nvim_get_current_win(), buf_num)

	vim.schedule(function()
		vim.api.nvim_buf_set_lines(buf_num, -2, -2, false, {
			"Exit: q",
			">>" .. buf_name,
			string.rep("-", vim.api.nvim_win_get_width(0) * 0.7)
		})
	end)

	local on_exit = function(obj)
			vim.schedule(function()
				vim.api.nvim_buf_set_lines(buf_num, -2, -2, false, { "", string.format("exit status: %d - signal: %d", obj.code, obj.signal) })
			end)
	end

	local on_stdout = function(err, data)
		if err then
			vim.schedule(function()
				vim.api.nvim_buf_set_lines(buf_num, -2, -2, false, vim.split(err:gsub('\r\n', '\n'), '\n', { trimempty = true }))
			end)
		end
		if data then
			vim.schedule(function()
				vim.api.nvim_buf_set_lines(buf_num, -2, -2, false, vim.split(data:gsub('\r\n', '\n'), '\n', {trimempty = true }))
			end)
		end
	end

	local on_stderr = function(err, data)
		if err then
			vim.schedule(function()
				vim.api.nvim_buf_set_lines(buf_num, -2, -2, false, vim.split(err:gsub('\r\n', '\n'), '\n', { trimempty = true }))
			end)
		end
		if data then
			vim.schedule(function()
				vim.api.nvim_buf_set_lines(buf_num, -2, -2, false, vim.split(data:gsub('\r\n', '\n'), '\n', {trimempty = true }))
			end)
		end
	end

	local opts = {
		cwd = Projective.root_dir,
		text = true,
		stdout = on_stdout,
		stderr = on_stderr,
	}

	vim.system(Projective.run_target, opts, on_exit)
end

return Projective
