return {
	"neovim/nvim-lspconfig",
	event = "UIEnter",
	dependencies = {
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
		{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
	},
	opts = {
		inlay_hints = { enabled = false },
		semantic_tokens = { enabled = true },
	},
	config = function()
		-- mason settings
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"pyright",
				"tsserver",
				"emmet_ls",
				"jsonls",
				"eslint",
        "marksman",
			},
		})
		require("mason-tool-installer").setup({
			ensure_installed = {
				--"codespell",
				-- python
				"black",
				"ruff",
				"stylua",
				"prettier",
			},
		})
		-- MasonToolsInstall won't start if event == VeryLazy
		vim.api.nvim_command("MasonToolsInstall")
		-- Lsp Configuration
		local lspconfig = require("lspconfig")

		-- disable semanticTokens
		-- local on_init = function(client, _)
		-- 	if client.supports_method("textDocument/semanticTokens") then
		-- 		client.server_capabilities.semanticTokensProvider = nil
		-- 	end
		-- end

		local capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
		-- local capabilities = vim.lsp.protocol.make_client_capabilities()
		-- capabilities.textDocument.completion.completionItem = {
		-- 	documentationFormat = { "markdown", "plaintext" },
		-- 	snippetSupport = true,
		-- 	preselectSupport = true,
		-- 	insertReplaceSupport = true,
		-- 	labelDetailsSupport = true,
		-- 	deprecatedSupport = true,
		-- 	commitCharactersSupport = true,
		-- 	tagSupport = { valueSet = { 1 } },
		-- 	resolveSupport = {
		-- 		properties = {
		-- 			"documentation",
		-- 			"detail",
		-- 			"additionalTextEdits",
		-- 		},
		-- 	},
		-- }

		-- on_attach
		-- Check server capabilities & Avoid invalid commands
		local on_attach = function(client, bufnr)
			if client.server_capabilities.documentHighlightProvider then
				vim.api.nvim_create_augroup("lsp_document_highlight", {
					clear = false,
				})
				vim.api.nvim_clear_autocmds({
					buffer = bufnr,
					group = "lsp_document_highlight",
				})
				vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
					group = "lsp_document_highlight",
					buffer = bufnr,
					callback = vim.lsp.buf.document_highlight,
				})
				vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
					group = "lsp_document_highlight",
					buffer = bufnr,
					callback = vim.lsp.buf.clear_references,
				})
			end
		end

		-- Servers
		-- lua
		lspconfig.lua_ls.setup({
			-- on_init = on_init,
			on_attach = on_attach,
			capabilities = capabilities,
		})
		-- python
		lspconfig.pyright.setup({
			-- on_init = on_init,
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				pyright = {
					-- Using Ruff's import organizer
					disableOrganizeImports = false,
				},
				python = {
					analysis = {
						ignore = { "*" },
						autoSearchPaths = true,
						useLibraryCodeForTypes = true,
						diagnosticMode = "openFilesOnly",
					},
				},
			},
		})

		-- tsserver
		lspconfig.tsserver.setup({
			-- on_init = on_init,
			on_attach = on_attach,
			capabilities = capabilities,
			init_options = {
				preferences = {
					disableSuggestions = true,
				},
			},
		})

		-- eslint (for javascript/typescript)
		lspconfig.eslint.setup({
			on_attach = function(client, bufnr)
				vim.api.nvim_create_autocmd("BufWritePre", {
					buffer = bufnr,
          client = client,
					command = "EslintFixAll",
				})
			end,
		})

		-- jinja
		lspconfig.emmet_ls.setup({
			-- on_init = on_init,
			on_attach = on_attach,
			capabilities = capabilities,
			filetypes = {
				"css",
				--"eruby",
				"html",
				--"javascript",
				"javascriptreact",
				"sass",
				"scss",
				--"typescriptreact",
				--"vue",
				-- "htmldjango"
			},
		})

		-- jsonls
		lspconfig.jsonls.setup({
			-- on_init = on_init,
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				json = {
					format = {
						enable = true,
					},
				},
			},
		})

    -- markdown
    lspconfig.marksman.setup({
      -- on_init = on_init,
      on_attach = on_attach,
      capabilities = capabilities,
    })

		-- Global mappings.
		vim.keymap.set("n", "<space>d", vim.diagnostic.open_float)
		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
		vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Enable completion triggered by <c-x><c-o>
				vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

				local map = function(keys, func, desc)
					vim.keymap.set("n", keys, func, { buffer = ev.buf, desc = "LSP: " .. desc })
				end

				map("gD", vim.lsp.buf.declaration, "[g]oto [D]eclaration")
				map("gd", require("telescope.builtin").lsp_definitions, "[g]oto [d]ifintion")
				map("gr", require("telescope.builtin").lsp_references, "[g]oto [r]reference")
				map("gi", require("telescope.builtin").lsp_implementations, "[g]oto [i]mplementatio")
				map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]definition")
				map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
				map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
				map("<leader>sh", vim.lsp.buf.signature_help, "")
				map("K", vim.lsp.buf.hover, "Hover documentation")
			end,
		})

		-- diagnostic
		vim.diagnostic.config({
			virtual_text = { prefix = "", source = "always" },
			-- virtual_text = false,
			signs = true,
			underline = true,
			update_in_insert = true,
			severity_sort = false,
		})

		-- diagnostic icons
		local signs = { Error = "", Warn = "󰀦", Hint = "󰌵", Info = "󰋼" }
		-- local signs = { Error = "E", Warn = "W", Hint = "H", Info = "I" }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
			vim.opt.signcolumn = "number"
		end

		-- Border
		-- UI
		local border = {
			{ "┌", "FloatBorder" },
			{ "─", "FloatBorder" },
			{ "┐", "FloatBorder" },
			{ "│", "FloatBorder" },
			{ "┘", "FloatBorder" },
			{ "─", "FloatBorder" },
			{ "└", "FloatBorder" },
			{ "│", "FloatBorder" },
		}

		-- To instead override globally
		local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
		function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
			opts = opts or {}
			opts.border = opts.border or border
			return orig_util_open_floating_preview(contents, syntax, opts, ...)
		end

		-- -- callback to "config/code_action.utils"
		-- vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
		-- 	group = vim.api.nvim_create_augroup("code_action_sign", { clear = true }),
		-- 	callback = function()
		-- 		require("config/code_action_utils").code_action_listener()
		-- 	end,
		-- })
	end,
}
