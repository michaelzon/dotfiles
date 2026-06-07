-- ════════════════════════════════════════════════════════════════════════════
-- LSP Keymaps (applied per-buffer on attach)
-- ════════════════════════════════════════════════════════════════════════════
-- local function setup_keymaps(bufnr)
--   local function map(mode, lhs, rhs, desc)
--     vim.keymap.set(mode, lhs, rhs, { buf = bufnr, desc = desc, silent = true })
--   end
--
--   -- Hover & Signature
--   map("n", "K", function()
--     vim.lsp.buf.hover({ border = "rounded", max_height = 25, max_width = 120 })
--   end, "Hover")
--   map({ "n", "i" }, "<C-k>", vim.lsp.buf.signature_help, "Signature Help")
--
--   -- gd, gD, gr, gi, gy handled by Snacks picker (snacks.lua)
--
--   -- Diagnostics navigation
--   map("n", "[d", function()
--     vim.diagnostic.jump({ count = -1 })
--   end, "Prev Diagnostic")
--   map("n", "]d", function()
--     vim.diagnostic.jump({ count = 1 })
--   end, "Next Diagnostic")
--
--   -- <leader>c = Code
--   map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code Action")
--   map("n", "<leader>cr", vim.lsp.buf.rename, "Rename Symbol")
--   map("n", "<leader>cd", vim.diagnostic.open_float, "Line Diagnostic")
--   map("n", "<leader>cv", "<cmd>vsplit | lua vim.lsp.buf.definition()<cr>", "Definition in Vsplit")
--
--   -- <leader>l = LSP (using native :lsp command from 0.12)
--   map("n", "<leader>li", "<cmd>checkhealth vim.lsp<cr>", "LSP Info")
--   map("n", "<leader>lr", "<cmd>lsp restart<cr>", "LSP Restart")
--   map("n", "<leader>lh", function()
--     vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }), { bufnr = bufnr })
--   end, "Toggle Inlay Hints")
-- end

-- ════════════════════════════════════════════════════════════════════════════
-- LspAttach Handler
-- ════════════════════════════════════════════════════════════════════════════
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then
      return
    end

    -- setup_keymaps(bufnr)

    -- Document highlight on cursor hold
    if client.server_capabilities.documentHighlightProvider then
      local group = vim.api.nvim_create_augroup("LspDocumentHighlight_" .. bufnr, { clear = true })
      vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        buffer = bufnr,
        group = group,
        callback = vim.lsp.buf.document_highlight,
      })
      vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
        buffer = bufnr,
        group = group,
        callback = vim.lsp.buf.clear_references,
      })
    end
  end,
})

-- ════════════════════════════════════════════════════════════════════════════
-- Diagnostic Configuration
-- ════════════════════════════════════════════════════════════════════════════
-- vim.diagnostic.config({
--   virtual_text = true,
--   underline = true,
--   update_in_insert = false,
--   severity_sort = true,
--   float = { border = "rounded", source = true, header = "", prefix = "" },
--   signs = {
--     text = {
--       [vim.diagnostic.severity.ERROR] = "󰅚 ",
--       [vim.diagnostic.severity.WARN] = "󰀪 ",
--       [vim.diagnostic.severity.INFO] = "󰋽 ",
--       [vim.diagnostic.severity.HINT] = "󰌶 ",
--     },
--     numhl = {
--       [vim.diagnostic.severity.ERROR] = "ErrorMsg",
--       [vim.diagnostic.severity.WARN] = "WarningMsg",
--     },
--   },
-- })

-- ════════════════════════════════════════════════════════════════════════════
-- LSP Server Configuration (native 0.12 API)
-- Server configs loaded from lsp/ directory, activated with vim.lsp.enable()
-- ════════════════════════════════════════════════════════════════════════════
vim.lsp.config("*", {
  root_markers = { ".git" },
})

vim.lsp.enable({
  "lua_ls",
  "ts_ls",
  "intelephense",
  "cssls",
  "html",
  "jsonls",
  "yamlls",
})

-- ════════════════════════════════════════════════════════════════════════════
-- Native Statusline
-- ════════════════════════════════════════════════════════════════════════════
local function statusline_escape(value)
  return tostring(value or ""):gsub("%%", "%%%%"):gsub("\n", " ")
end

local function git_branch()
  local branch = vim.b.gitsigns_head
  if not branch or branch == "" then
    return ""
  end

  return statusline_escape("󰊢 " .. branch)
end

local function lsp_status()
  local clients = vim.lsp.get_clients({ bufnr = vim.api.nvim_get_current_buf() })
  if #clients == 0 then
    return ""
  end

  local names = {}
  local seen = {}
  for _, client in ipairs(clients) do
    if not seen[client.name] then
      seen[client.name] = true
      table.insert(names, client.name)
    end
  end
  table.sort(names)

  return statusline_escape("󰒋 " .. table.concat(names, ","))
end

local function formatter_status()
  local ok, conform = pcall(require, "conform")
  if not ok or type(conform.list_formatters_to_run) ~= "function" then
    return ""
  end

  local list_ok, formatters = pcall(conform.list_formatters_to_run, 0)
  if not list_ok or not formatters or #formatters == 0 then
    return ""
  end

  local names = {}
  for _, formatter in ipairs(formatters) do
    local name = type(formatter) == "table" and formatter.name or formatter
    if name then
      table.insert(names, tostring(name))
    end
  end

  return statusline_escape("󰉿 " .. table.concat(names, ","))
end

local function linter_status()
  local ok, lint = pcall(require, "lint")
  if not ok then
    return ""
  end

  local linters = (lint.linters_by_ft or {})[vim.bo.filetype] or {}
  if type(linters) == "function" then
    linters = linters()
  end
  if not linters or #linters == 0 then
    return ""
  end

  return statusline_escape("󰁨 " .. table.concat(linters, ","))
end

local function safe_call(fn)
  local ok, result = pcall(fn)
  return ok and result or ""
end

_G.lvim_git_branch = function()
  return safe_call(git_branch)
end

_G.lvim_lsp_status = function()
  return safe_call(lsp_status)
end

_G.lvim_formatter_status = function()
  return safe_call(formatter_status)
end

_G.lvim_linter_status = function()
  return safe_call(linter_status)
end

vim.opt.statusline = table.concat({
  "%{v:lua.lvim_git_branch()}",
  "%f",
  "%m",
  "%r",
  "%=",
  "%{v:lua.lvim_linter_status()}",
  "%{v:lua.lvim_formatter_status()}",
  "%{v:lua.lvim_lsp_status()}",
  "%l:%c",
  "%p%%",
}, " ")

vim.api.nvim_create_autocmd({ "LspAttach", "LspDetach" }, {
  group = vim.api.nvim_create_augroup("UserStatusline", { clear = true }),
  callback = function()
    vim.cmd.redrawstatus()
  end,
})

-- ════════════════════════════════════════════════════════════════════════════
-- Mason: auto-install LSP servers, formatters, and linters
-- ════════════════════════════════════════════════════════════════════════════
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        phpactor = { enabled = false },
      },
    },
  },
  {
    "mason-org/mason.nvim",
    lazy = false,
    opts = {},
  },
  {
    "mason-org/mason-lspconfig.nvim",
    lazy = false,
    dependencies = { "mason-org/mason.nvim" },
    opts = {
      automatic_installation = true,
      automatic_enable = { exclude = { "phpactor", "vtsls" } },
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    lazy = false,
    dependencies = { "mason-org/mason.nvim" },
    opts = {
      ensure_installed = {
        -- Linters
        "eslint_d",
        "luacheck",
        "markdownlint",
        "yamllint",
        "jsonlint",
        "htmlhint",
        "stylelint",
        "phpstan",
        -- Formatters
        "stylua",
        "prettier",
        "isort",
        "pint",
      },
    },
  },
}
