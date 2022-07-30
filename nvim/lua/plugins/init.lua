require("Comment").setup()

local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = vim.fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
end
vim.cmd([[packadd packer.nvim]])

local ok, packer = pcall(require, "packer")

if not ok then
	return
end

packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "single" })
		end,
		prompt_border = "single",
	},
	git = {
		clone_timeout = 600,
	},
	auto_clean = true,
	compile_on_sync = false,
})

return packer.startup(function(use)
	-- General
	use("wbthomason/packer.nvim")
	use("nvim-lua/popup.nvim")
	use("nvim-lua/plenary.nvim")
	use("kyazdani42/nvim-web-devicons")
	use({ "nvim-lualine/lualine.nvim", config = require("plugins.configs.lualine") })
	use({ "kyazdani42/nvim-tree.lua", config = require("plugins.configs.nvim-tree") })
	use("tpope/vim-surround")
	use("tpope/vim-repeat")
	use({ "nvim-telescope/telescope.nvim", config = require("plugins.configs.telescope") })
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate", config = require("plugins.configs.treesitter") })
	use("p00f/nvim-ts-rainbow")
	use({ "lewis6991/gitsigns.nvim", config = require("plugins.configs.gitsigns") })
	use("tpope/vim-fugitive")
	use("christoomey/vim-tmux-navigator")
	use({ "windwp/nvim-autopairs", config = require("plugins.configs.autopairs") })
	use("sindrets/diffview.nvim")
	use({ "RRethy/vim-illuminate" })

	-- buffers
	use({ "akinsho/bufferline.nvim", config = require("plugins.configs.bufferline") })
	use("moll/vim-bbye")

	-- cmp plugins
	use({ "hrsh7th/nvim-cmp", config = require("plugins.configs.cmp") })
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("saadparwaiz1/cmp_luasnip")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")

	-- snippets
	use("rafamadriz/friendly-snippets")
	use("L3MON4D3/LuaSnip")

	-- LSP
	use({
		"williamboman/nvim-lsp-installer",
		requires = {
			"neovim/nvim-lspconfig",
			"jose-elias-alvarez/typescript.nvim",
		},
	})
	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	})
	use({ "folke/trouble.nvim", config = require("plugins.configs.trouble") })

	-- colorscheme
	use({ "ellisonleao/gruvbox.nvim", requires = { "rktjmp/lush.nvim" } })

	-- comments
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})
	use("JoosepAlviste/nvim-ts-context-commentstring")

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
