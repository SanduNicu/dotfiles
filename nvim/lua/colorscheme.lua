local colorscheme = "gruvbox-material"
vim.o.background = "dark"

vim.g.gruvbox_material_background = 'medium'
vim.g.gruvbox_material_foreground = 'original'

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

-- vim.cmd([[hi normal guibg=NONE ctermbg=NONE]])
