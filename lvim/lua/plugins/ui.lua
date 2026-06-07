return {
  { "nvim-lualine/lualine.nvim", enabled = true },
  { "akinsho/bufferline.nvim", enabled = false },
  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = { { "nvim-mini/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
    keys = {
      { "-", "<cmd>Oil<cr>", desc = "Open parent directory" },
      {
        "<leader>-",
        function()
          require("oil").open_float()
          vim.api.nvim_get_current_buf()
          vim.g.oil_view_options = vim.g.oil_view_options or {}
          require("oil").set_show_hidden(true)
        end,
        desc = "Toggle Oil floating window (always showing hidden)",
      },
    },
  },
  {
    "nvim-mini/mini.starter",
    opts = function(_, opts)
      opts.header = table.concat({
        "  ░▒▓██████████████▓▒░░▒▓████████▓▒░▒▓████████▓▒░      ",
        "  ░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░             ░▒▓█▓▒░      ",
        "  ░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░           ░▒▓██▓▒░       ",
        "  ░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓██████▓▒░    ░▒▓██▓▒░         ",
        "  ░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░       ░▒▓██▓▒░           ",
        "  ░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░             ",
        "  ░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓████████▓▒░      ",
      }, "\n")
      return opts
    end,
  },
  { "nvim-mini/mini.statusline", version = "*", config = true },
}
