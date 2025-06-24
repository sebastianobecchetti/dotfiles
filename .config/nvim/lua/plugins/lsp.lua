return {
  -- Mason: installa automaticamente gli strumenti
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "pyright",
        "ruff",
        "rust-analyzer",
        "codelldb", -- Debugger Rust
      },
    },
  },

  -- Selettore di venv per Python
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-telescope/telescope.nvim",
      "mfussenegger/nvim-dap-python",
    },
    branch = "regexp",
    opts = {
      name = "venv",
      auto_refresh = false,
      -- stay_on_this_version = true,
    },
    event = "VeryLazy",
    keys = {
      { "<leader>vs", "<cmd>VenvSelect<cr>", desc = "Select VirtualEnv" },
      { "<leader>vc", "<cmd>VenvSelectCached<cr>", desc = "Use Cached VirtualEnv" },
    },
  },

  -- Configurazioni dei linguaggi
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- PYTHON
        pyright = {},
      },
    },
  },
}
