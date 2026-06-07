return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        contrast = "hard",
      })
      -- Set your preferred default startup mode here (dark or light)
      vim.o.background = "dark"
      vim.cmd([[colorscheme gruvbox]])
    end,
  },
  { "projekt0n/github-nvim-theme", name = "github-theme" },
  {
    "rebelot/kanagawa.nvim",
    -- lazy = false,
    -- priority = 1000,
    -- config = function()
    -- require("kanagawa").setup({
    --   background = {
    --     dark = "wave",
    --     light = "lotus",
    --   },
    -- }),
    --
    --   vim.o.background = "light"
    --   vim.cmd("colorscheme kanagawa")
    -- end,
  },
  {
    "EdenEast/nightfox.nvim",
    -- name = "nightfox",
    -- config = function()
    --   vim.cmd("colorscheme nightfox")
    -- end,
  },
  {
    "rose-pine/neovim",
    -- name = "rose-pine",
    -- config = function()
    --   vim.cmd("colorscheme rose-pine")
    -- end,
  },
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    -- priority = 1000,
  },
  {
    "e-ink-colorscheme/e-ink.nvim",
    -- priority = 1000,
    -- config = function()
    -- require("e-ink").setup()
    -- vim.cmd.colorscheme("e-ink")

    -- choose light mode or dark mode
    -- vim.opt.background = "dark"
    -- vim.opt.background = "light"
    --
    -- or do
    -- :set background=dark
    -- :set background=light
    -- end,
  },
}
