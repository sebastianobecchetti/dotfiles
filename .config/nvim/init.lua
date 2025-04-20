-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.opt.expandtab = false
vim.opt.termguicolors = true
vim.cmd("filetype plugin indent on")
vim.lsp.inlay_hint.enable(false)
