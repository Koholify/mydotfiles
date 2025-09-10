local builtins = require("telescope.builtin")

return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
	    {'<leader>bb', builtins.buffers, {desc = "Show Buffers" }},
	    {'<leader>bg', builtins.git_files, {desc = "Show Git File" }},
	    {'<leader>bf', builtins.find_files, {desc = "Show Files" }},
    },
}
