return {
  "rebelot/kanagawa.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("kanagawa").setup({
      background = {
        dark = "wave",
        light = "lotus",
      },
    })

    vim.o.background = "light"
    vim.cmd("colorscheme kanagawa")
  end,
}

