print"hello"

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("config.lazy")
require("config.lsp")
require("config.options")
require("config.mappings")
require("projective").setup()
