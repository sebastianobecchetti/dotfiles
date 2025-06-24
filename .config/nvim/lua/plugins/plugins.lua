return {
  -- Trouble config (disabilitato)
  {
    "folke/trouble.nvim",
    opts = { use_diagnostic_signs = true },
  },
  { "folke/trouble.nvim", enabled = false },

  -- Emoji completion
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    opts = function(_, opts)
      table.insert(opts.sources, { name = "emoji" })
    end,
  },

  -- Telescope personalizzato
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader>fp",
        function()
          require("telescope.builtin").find_files({
            cwd = require("lazy.core.config").options.root,
          })
        end,
        desc = "Find Plugin File",
      },
    },
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
  },

  -- Treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
        "rust",
        "java",
      })
    end,
  },

  -- Lualine config base
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, {
        function()
          return "😄"
        end,
      })
    end,
  },

  -- Override Lualine defaults
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      return {
        options = {
          theme = "gruvbox",
          section_separators = "",
          component_separators = "",
        },
      }
    end,
  },

  -- { import = "lazyvim.plugins.extras.ui.mini-starter" },

  -- JSON extras
  { import = "lazyvim.plugins.extras.lang.json" },

  -- Mason: strumenti da installare
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
        "rust-analyzer",
        "codelldb",
        "jdtls",
      },
    },
  },

  -- { "echasnovski/mini.nvim", version = false },
}
