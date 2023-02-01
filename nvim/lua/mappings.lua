vim = vim
local keyset = vim.keymap.set
vim.g.mapleader = ' '

keyset('n', '<space>', '<nop>', {remap = false})
keyset('n', '<f4>', ':%bdelete|edit #|bd # |normal `"|zz<cr>', {remap = false})
keyset('n', '<f5>', ':NvimTreeToggle<cr>', {remap = false})
keyset('n', '<c-q>', ':q!<cr>', {remap = false})
keyset('n', '<leader>z', ':tabnew<cr>', {remap = false})

--- Terminal
keyset('n', '<f6>', ':ToggleTerm direction=float<cr>', {remap = false})
keyset('t', '<c-n>', '<c-\\><c-n>', {remap = false})
keyset('t', '<f6>', '<cmd>:ToggleTerm<cr>')
keyset('n', '<leader>cm', ':TermExec cmd="cmake . && cmake --build ." direction=float<cr>', {remap = false})

--- Tabs
keyset('n', '<tab>', 'gt', {remap = false})
keyset('n', '<s-tab>', 'gT', {remap = false})
keyset('n', '<c-n>', ':tabnew<cr>', {remap = false})

--- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>?', '<cmd>Telescope oldfiles<cr>')
