return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"b0o/schemastore.nvim",
	},
	config = function()
		require("mason").setup({
			ui = {
				height = 0.8,
			},
		})

		require("mason-lspconfig").setup({ automatic_installation = true })

		-- set of capabilities that the language servers should understand to make the completion engine to work properly
		--local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		vim.lsp.config("intelephense", {
			capabilities = capabilities,
		})
		vim.lsp.enable("intelephense")

		vim.lsp.enable("ts_ls")
		vim.lsp.config("ts_ls", {
			capabilities = capabilities,
			cmd = { "typescript-language-server", "--stdio" },
			filetypes = {
				"javascript",
				"javascriptreact",
				"javascript.jsx",
				"typescript",
				"typescriptreact",
				"typescript.tsx",
			},
		})

		vim.lsp.enable("tailwindcss")
		vim.lsp.config("tailwindcss", {
			capabilities = capabilities,
		})

		vim.lsp.enable("jsonls")
		vim.lsp.config("jsonls", {
			capabilities = capabilities,
			settings = {
				json = {
					schemas = require("schemastore").json.schemas(),
					validate = { enable = true },
				},
			},
		})

		local function organize_imports()
			local params = {
				command = "_typescript.organizeImports",
				arguments = { vim.api.nvim_buf_get_name(0) },
				title = "",
			}
			vim.lsp.buf.execute_command(params)
		end

		vim.api.nvim_create_user_command("OrganizeTSImports", organize_imports, { desc = "Organize TS imports" })

		-- Diagnostic configuration
		vim.diagnostic.config({
			virtual_text = false,
			signs = true,
			underline = true,
			float = {
				source = true,
			},
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "",
					[vim.diagnostic.severity.WARN] = "",
					[vim.diagnostic.severity.INFO] = "",
					[vim.diagnostic.severity.HINT] = "",
				},
			},
		})
	end,
}
