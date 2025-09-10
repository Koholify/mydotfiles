local vim = vim

local key_set = vim.keymap.set

key_set('n', '<leader>o', function()
	local qf_open = false
	for _, win in pairs(vim.fn.getwininfo()) do
		if win.quickfix == 1 then
			qf_open = true
		end
	end

	if qf_open then vim.cmd"cclose"
	else vim.cmd"copen"
	end
end);

key_set('n', '<leader>l', function()
	local loclist_open = false
	for _, win in pairs(vim.fn.getwininfo()) do
		if win.loclist == 1 then
			loclist_open = true
		end
	end

	if loclist_open then vim.cmd"lclose"
	else vim.diagnostic.setloclist()
	end
end);

key_set('n', '<leader>rn', vim.lsp.buf.rename, {remap = false})

key_set('n', '<leader>n', ":bnext<CR>")
key_set('n', '<leader>p', ":bprevious<CR>")

key_set('n', '<s-tab>', 'gt', {remap = false})
key_set('n', '<leader>t', ':tabnew<CR>', {remap = false})

key_set('n', "<leader>cc", ":Task start cmake build")
key_set('n', "<leader>cC", ":Task start cmake configure")
key_set('n', "<leader>ct", ":Task set_module_param cmake target")
key_set('n', "<leader>cr", ":Task start cmake run")

key_set('n', "<leader>cm", ":Task start make all")

local telescope = require('telescope.builtin')
key_set('n', '<leader>b', telescope.buffers, {desc = "Telescope Buffer"})
