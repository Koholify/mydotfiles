local vim = vim
local keyset = vim.keymap.set
vim.g.mapleader = ' '

keyset('n', '<space>', '<nop>', {remap = false})
keyset('n', '<f4>', ':%bdelete|edit #|bd # |normal `"|zz<cr>', {remap = false})
keyset('n', '<f5>', ':NvimTreeToggle<cr>', {remap = false})
keyset('n', '<c-q>', ':q!<cr>', {remap = false})
keyset('n', '<leader>z', ':tabnew<cr>', {remap = false})
keyset('n', '<leader>e', ':NvimTreeFocus<cr>', {remap = false})

local function go_default_org_file()
  local p = require('orgmode.config').org_default_notes_file;
  vim.cmd.edit(p)
end
keyset('n', '<leader>ogd', go_default_org_file, {remap = false})

--- Windows
keyset('n', '<leader>v', ':vsplit<cr>', {remap = false})
keyset('n', '<leader>s', ':split<cr>', {remap = false})
keyset('n', '<leader><left>', '<c-w>h', {remap = false})
keyset('n', '<leader><right>', '<c-w>l', {remap = false})
keyset('n', '<leader><down>', '<c-w>j', {remap = false})
keyset('n', '<leader><up>', '<c-w>k', {remap = false})
keyset('n', '<leader>h', '<c-w>h', {remap = false})
keyset('n', '<leader>l', '<c-w>l', {remap = false})
keyset('n', '<leader>j', '<c-w>j', {remap = false})
keyset('n', '<leader>k', '<c-w>k', {remap = false})

--- Terminal
keyset('n', '<f6>', ':ToggleTerm direction=float<cr>', {remap = false})
keyset('t', '<c-n>', '<c-\\><c-n>', {remap = false})
keyset('t', '<f6>', '<cmd>:ToggleTerm<cr>')
keyset('n', '<leader>cm', ':TermExec cmd="cmake . && cmake --build ." direction=float<cr>', {remap = false})
keyset('n', '<leader>t', ':term<cr>', {remap = false})
keyset('t', '<c-q>', '<cmd>:q!<cr>')

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
vim.keymap.set('n', '<leader>cs', '<cmd>Telescope colorscheme<cr>')
