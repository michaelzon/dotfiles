return {
  "ibhagwan/fzf-lua",
  config = function()
    -- ... other config and keymaps ...

    vim.keymap.set("n", "<leader>s.", function()
      -- Fill the table with parent directories
      local dirs = {}
      for dir in vim.fs.parents(vim.uv.cwd()) do
        table.insert(dirs, dir)
      end

      -- Open a custom fzf to select a directory and launch fzf-files
      require("fzf-lua").fzf_exec(dirs, {
        prompt = "Parent Directories❯ ",
        actions = {
          ["default"] = function(selected)
            fzf.files({ cwd = selected[1] })
          end,
        },
      })
    end, { desc = "[S]earch Parent Directories [..]" })

    -- ... other config and keymaps ...
  end,
}
