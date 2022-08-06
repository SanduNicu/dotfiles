local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

nvim_tree.setup({
	update_cwd = false,
	update_focused_file = {
		enable = true,
		update_cwd = false,
	},
})
