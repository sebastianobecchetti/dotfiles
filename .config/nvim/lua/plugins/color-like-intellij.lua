return {
  "NvChad/nvim-colorizer.lua",
  event = "BufReadPre",
  opts = {
    user_default_options = {
      RGB = true, -- #RGB hex codes
      RRGGBB = true, -- #RRGGBB hex codes
      names = true, -- "blue" or "Color.cyan"
      RRGGBBAA = true, -- #RRGGBBAA hex codes
      rgb_fn = true, -- rgb() and rgba()
      hsl_fn = true, -- hsl() and hsla()
      css = true, -- Enable all CSS features: names, rgb, hsl, etc.
      mode = "foreground", -- "background" | "foreground"
    },
  },
}
