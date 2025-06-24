-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- vim.cmd("filetype plugin indent on")
vim.lsp.inlay_hint.enable(false)

vim.g.lazyvim_check_order = false
