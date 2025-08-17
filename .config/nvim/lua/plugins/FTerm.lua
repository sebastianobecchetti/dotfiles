return {
  "numToStr/FTerm.nvim",
  config = function()
    require("FTerm").setup({
      border = "rounded",
      dimensions = {
        height = 0.9,
        width = 0.9,
      },
    })

    -- Esempio di mapping per aprire il terminale
    vim.keymap.set("n", "<A-i>", function()
      require("FTerm").toggle()
    end, { desc = "Toggle FTerm" })
  end,
}
