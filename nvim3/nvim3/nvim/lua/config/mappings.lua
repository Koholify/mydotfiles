local keyset = vim.keymap.set;

local function toggle_quickfixlist()
	local qf_open = false
	for _, win in pairs(vim.fn.getwininfo()) do
		if win.quickfix == 1 then
			qf_open = true
		end
	end

	if qf_open then vim.cmd"cclose"
	else vim.cmd"copen"
	end
end

keyset('n', '<leader>dl', vim.diagnostic.setloclist, {desc = "View File Diagnostics"})
keyset('n', '<leader>x1', ':only<cr>', {desc = "Close Other Windows"})
keyset('n', '<leader>qq', toggle_quickfixlist, {desc = "Toggle Quickfix list"})

