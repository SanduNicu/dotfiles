-- local lsp_ok, nvim_lsp = pcall(require, "lspconfig")
-- if not lsp_ok then
-- 	return vim.notify("lspconfig not found!", "error")
-- end

local status, null_ls = pcall(require, "null-ls")
if not status then
	return vim.notify("null_ls not found!", "error")
end

local mason_ok, mason = pcall(require, "mason")
if not mason_ok then
	return vim.notify("mason not found!", "error")
end

local conf_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not conf_ok then
	return vim.notify("mason_lspconfig not found!", "error")
end

local on_attach = function(_, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end

	local opts = { noremap = true, silent = true }

	buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
	buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
	buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
	buf_set_keymap("n", "gk", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
	buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
	buf_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
	buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
	buf_set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
	buf_set_keymap("n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<cr>', opts)
	buf_set_keymap("n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<cr>', opts)
	buf_set_keymap("n", "<leader>ds", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
	buf_set_keymap("n", "<leader>dl", "<cmd>lua vim.diagnostic.setloclist()<cr>", opts)
	-- buf_set_keymap("n", "<leader>di", "<cmd>lua vim.diagnostic.show_line_diagnostics()<cr>", opts)
	vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format({async = true})' ]])
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

mason.setup()
mason_lspconfig.setup()
mason_lspconfig.setup_handlers({
	function(server_name)
		require("lspconfig")[server_name].setup({
			capabilities = capabilities,
			on_attach = function(client, bufnr)
				local function buf_set_keymap(...)
					vim.api.nvim_buf_set_keymap(bufnr, ...)
				end

				if server_name == "tsserver" then
					client.server_capabilities.document_formatting = false
					client.server_capabilities.document_range_formatting = false
					local opts = { noremap = true, silent = true, nowait = true }
					buf_set_keymap("n", "<leader>tr", "<cmd>TypescriptRemoveUnused<CR>", opts)
					buf_set_keymap("n", "<leader>to", ":TypescriptOrganizeImports<CR>", opts)
					buf_set_keymap("n", "<leader>ta", ":TypescriptAddMissingImports<CR>", opts)
					buf_set_keymap("n", "<leader>tx", ":TypescriptFixAll<CR>", opts)
					buf_set_keymap("n", "<leader>tr", ":TypescriptRenameFile<CR>", opts)
				end
				if server_name == "sumneko_lua" then
					client.server_capabilities.document_formatting = false
					client.server_capabilities.document_range_formatting = false
				end
				on_attach(client, bufnr)
			end,
		})
	end,
})

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.prettierd,
		null_ls.builtins.code_actions.eslint_d,
		null_ls.builtins.diagnostics.eslint_d,
	},
})

-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
	signs = true,
	virtual_text = false,
	update_in_insert = true,
	float = {
		show_header = true,
		source = "always",
		border = "rounded",
	},
})
