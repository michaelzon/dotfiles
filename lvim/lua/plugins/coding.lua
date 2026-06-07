return {
  -- ════════════════════════════════════════════════════════════════════════════
  -- Completion (blink.cmp)
  -- ════════════════════════════════════════════════════════════════════════════
  -- {
  --   "saghen/blink.cmp",
  --   version = "*",
  --   config = function()
  --     require("blink.cmp").setup({
  --       keymap = {
  --         ["<S-Tab>"] = { "select_prev", "fallback" },
  --         ["<Tab>"] = { "select_next", "fallback" },
  --       },
  --     })
  --   end,
  -- },
  {
    "adibhanna/laravel.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>la", ":Artisan<cr>", desc = "Laravel Artisan" },
      { "<leader>lc", ":Composer<cr>", desc = "Composer" },
      { "<leader>lr", ":LaravelRoute<cr>", desc = "Laravel Routes" },
      { "<leader>lm", ":LaravelMake<cr>", desc = "Laravel Make" },
    },
    config = function()
      require("laravel").setup()
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
        require("luasnip.loaders.from_vscode").lazy_load({ paths = vim.fn.stdpath("config") .. "/snippets/" })
      end,
    },
  },
  { "tpope/vim-surround" },
}
