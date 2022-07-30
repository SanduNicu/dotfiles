local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local codeActions = null_ls.builtins.code_actions

local M = {}

M.setup = function(on_attach)
	null_ls.setup({
		sources = {
			codeActions.eslint,
			diagnostics.eslint,
			formatting.prettier,

			formatting.black.with({ extra_args = { "--fast" } }),
			formatting.stylua,
			diagnostics.flake8,
		},
		on_attach = on_attach,
	})
end

return M
