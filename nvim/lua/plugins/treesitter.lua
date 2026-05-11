return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "VeryLazy" },

  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
    "nvim-treesitter/nvim-treesitter-textobjects",
  },

  main = "nvim-treesitter.configs",

  opts = {
    ensure_installed = {
      "javascript",
      "typescript",
      "tsx",
      "json",
      "html",
      "css",
      "lua",
      "php",
      "php_only",
      "phpdoc",
    },

    highlight = {
      enable = true,
    },

    indent = {
      enable = true,
    },

    auto_install = true,
    
    rainbow = {
      enable = true,
    }
    
    -- textobjects = {
    --   select = {
    --     enable = true,
    --     lookahead = true,
    --
    --     keymaps = {
    --       -- Functions
    --       ["af"] = "@function.outer",
    --       ["if"] = "@function.inner",
    --
    --       -- Parameters
    --       ["aa"] = "@parameter.outer",
    --       ["ia"] = "@parameter.inner",
    --     },
    --   },
    -- },
  },
}

