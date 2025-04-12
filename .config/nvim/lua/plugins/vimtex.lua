return {
  "lervag/vimtex",
  ft = { "tex" },
  init = function()
    vim.cmd("filetype plugin indent on")
    vim.cmd("syntax enable")

    -- Usa latexmk (default, quindi puoi anche omettere questa riga)
    vim.g.vimtex_compiler_method = "latexmk"

    -- Visualizzatore PDF (puoi cambiarlo a seconda di quello che usi)
    vim.g.vimtex_view_method = "zathura"
    -- Se usi okular, puoi configurare anche questo:
    -- vim.g.vimtex_view_method = "general"
    vim.g.vimtex_view_general_viewer = "zathura"
    vim.g.vimtex_view_general_options = "--unique file:@pdf\\#src:@line@tex"
  end,
}
