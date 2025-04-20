return {
  "neobsync.nvim",
  dir = "/home/sebastiano/neobsync.nvim", -- example: /home/user/neovim_plugins/neobsync.nvim
  config = function()
    require("neobsync.config").setup({
      vault_path = "/home/sebastiano/Documents/Unipg/", -- example: /home/user/Documents/Notes/
      HOST = "127.0.0.1",
      PORT = 9000,
    })
    require("neobsync").setup()
  end,
}
