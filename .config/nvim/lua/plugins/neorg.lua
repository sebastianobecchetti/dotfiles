
return {
  "nvim-neorg/neorg",
  dependencies = { "nvim-lua/plenary.nvim" },
  build = ":Neorg sync-parsers",
  ft = "norg",
  config = function()
    require("neorg").setup {
      load = {
        ["core.defaults"] = {}, -- funzionalità base
        ["core.concealer"] = {}, -- evidenziazione e simboli carini
        ["core.dirman"] = {
          config = {
            workspaces = {
              notes = "~/neorg", -- puoi cambiare questo percorso
            },
            default_workspace = "notes",
          }
        },
      },
    }
  end,
}
