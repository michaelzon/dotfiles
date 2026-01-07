return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = 'Neotree',
    keys = {
      { '<leader>1', ':Neotree position=left<CR>' },
      { '<leader>n', ':Neotree position=float<CR>' },
    },
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false, -- neo-tree will lazily load itself
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
        },
      },
    },
    config = function()
      require("neo-tree").setup({
        close_if_last_window = true,
      })
    end,
  },
}
