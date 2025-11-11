return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      -- Diciamo a lspconfig di modificare la configurazione di jdtls
      jdtls = {
        handlers = {
          -- Disabilita i popup "showMessage" (la causa più comune)
          ["window/showMessage"] = function() end,

          -- Disabilita anche i popup "progress" (se i primi non bastano)
          ["$/progress"] = function() end,
        },
      },
    },
  },
}
