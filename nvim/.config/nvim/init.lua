-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.opt.linespace = 10
vim.opt.cursorline = true
require("notify").setup({
  background_colour = "#000000",
})
