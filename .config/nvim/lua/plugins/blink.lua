return {
  {
    "saghen/blink.cmp",
    opts = function(_, opts)
      opts.completion.documentation = {
        auto_show = false,
      }

      opts.keymap = vim.tbl_deep_extend("force", opts.keymap or {}, {
        preset = "default",
        ["<TAB>"] = { "select_and_accept" },
      })
    end,
  },

}
