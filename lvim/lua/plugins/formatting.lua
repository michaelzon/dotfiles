return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>gf",
        function()
          require("conform").format({ async = true }, function(err, did_edit)
            if not err and did_edit then
              vim.notify("Formatted", vim.log.levels.INFO)
            end
          end)
        end,
        mode = { "n", "v" },
        desc = "Format",
      },
    },
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        json = { "prettier" },
        jsonc = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
        python = { "isort", "black" },
        php = { "pint" },
        sh = { "shfmt" },
        bash = { "shfmt" },
      },
      default_format_opts = {
        lsp_format = "fallback",
      },
    },
    init = function()
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

      vim.api.nvim_create_user_command("Format", function(args)
        local range = nil
        if args.count ~= -1 then
          local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
          range = {
            start = { args.line1, 0 },
            ["end"] = { args.line2, end_line:len() },
          }
        end
        require("conform").format({ async = true, lsp_format = "fallback", range = range })
      end, { range = true })
    end,
  },
  { -- Assuming you init/setup snacks.nvim in a different file
    "folke/snacks.nvim",
    opts = function()
      vim.g.autoformat = true -- Sets up the default value to be true

      Snacks.toggle
        .new({
          id = "Format on Save",
          name = "Format on Save",
          get = function()
            return vim.g.autoformat
          end,
          set = function(_)
            vim.g.autoformat = not vim.g.autoformat
          end,
        })
        :map("<leader>uf")
    end,
  },

  { -- lazy
    "ccaglak/namespace.nvim",
    keys = {
      { "<leader>la", "<cmd>Php classes<cr>" },
      -- { "<leader>lc", "<cmd>Php class<cr>" },
      { "<leader>ln", "<cmd>Php namespace<cr>" },
      { "<leader>ls", "<cmd>Php sort<cr>" },
    },
    dependencies = {
      "ccaglak/phptools.nvim", -- optional
      "ccaglak/larago.nvim", -- optional
    },
    init = function()
      require("namespace").setup({
        ui = true, -- default: true -- false only if you want to use your own ui
        cacheOnload = false, -- default: false -- cache composer.json on load
        dumpOnload = false, -- default: false -- dump composer.json on load
        sort = {
          on_save = false, -- default: false -- sorts on every search
          sort_type = "length_desc", -- default: natural -- seam like what pint is sorting
          --  ascending -- descending -- length_asc
          -- length_desc -- natural -- case_insensitive
        },
      })
    end,
  },
  vim.keymap.set("n", "<leader>la", "<cmd>Php classes<cr>", { desc = "GetClasses", silent = true }),
  -- vim.keymap.set("n", "<leader>lc", "<cmd>Php class<cr>", { desc = "GetClass", silent = true }),
  vim.keymap.set("n", "<leader>ln", "<cmd>Php namespace<cr>", { desc = "Namespace", silent = true }),
  vim.keymap.set("n", "<leader>ls", "<cmd>Php sort<cr>", { desc = "Sort Classes", silent = true }),
}
