local status_ok, saga = pcall(require, "lspsaga")
if not status_ok then
	return vim.notify("lspsaga not found", "error")
end

saga.init_lsp_saga({
	code_action_icon = "",
})

