-- local colorscheme = "gruvbox"
-- local colorscheme = "gruvbox-material"
local colorscheme = "gruvbox-baby"

vim.o.background = "dark"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

-- vim.cmd([[hi normal guibg=NONE ctermbg=NONE]])
