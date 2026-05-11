return {
  "Shatur/neovim-ayu",
  lazy = false,
  priority = 1000,
  config = function()
    require("ayu").setup({
      mirage = true,
      overrides = {
        Comment = { italic = true },
        -- Function = { bg = '#ff77d5'},
        -- Normal = { bg = '#252935'},
      }
    })
    require("ayu").colorscheme()
  end,
}

-- this is a comment

