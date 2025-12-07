return {
  "FluxxField/bionic-reading.nvim",
  config = function()
    require("bionic-reading").setup({
      auto_highlight = true,

      -- DEVI aggiungere qui ogni filetype che vuoi abilitare
      file_types = {
        ["text"] = "any",
        ["markdown"] = "any", -- Aggiunto per i file Markdown
        ["lua"] = "any", -- Modificato da {"comment"} a "any"
        ["python"] = "any", -- Aggiunto per Python
        ["java"] = "any", -- Aggiunto per Java
        ["javascript"] = "any", -- Aggiunto per JS
        ["typescript"] = "any", -- Aggiunto per TS
        ["html"] = "any", -- Aggiunto per HTML
        ["css"] = "any", -- Aggiunto per CSS
        ["c"] = "any", -- Aggiunto per C
        ["cpp"] = "any", -- Aggiunto per C++
        -- Aggiungi qualsiasi altro tipo di file che usi...
      },

      hl_group_value = {
        bold = true,
      },

      -- Impostando questo a `false`, eviti la domanda
      -- "Vuoi abilitarlo?" sui file non in lista.
      -- Ma non li abiliterà automaticamente.
      prompt_user = false,

      treesitter = true,
      update_in_insert_mode = true,
    })
  end,
}
