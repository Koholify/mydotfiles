return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
	    {'<leader>bb', require("telescope.builtin").buffers, {desc = "Show Buffers" }},
	    {'<leader>bg', require("telescope.builtin").git_files, {desc = "Show Git File" }},
	    {'<leader>bf', require("telescope.builtin").find_files, {desc = "Show Files" }},
    },
}
