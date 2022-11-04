local status, packer = pcall(require, "packer")
if not status then
	print("Packer is not installed")
	return
end

vim.cmd([[packadd packer.nvim]])

packer.startup(function(use)
	use("wbthomason/packer.nvim")
	use("nvim-lua/popup.nvim")
	use("nvim-lua/plenary.nvim")

	-- General
	use("kyazdani42/nvim-web-devicons")
	use({ "nvim-lualine/lualine.nvim", config = require("plugins.configs.lualine") })
	use({ "kyazdani42/nvim-tree.lua", config = require("plugins.configs.nvim-tree") })
	use("tpope/vim-surround")
	use("tpope/vim-repeat")
	use({ "nvim-telescope/telescope.nvim", config = require("plugins.configs.telescope") })
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate", config = require("plugins.configs.treesitter") })
	-- use("p00f/nvim-ts-rainbow")
	use({ "lewis6991/gitsigns.nvim", config = require("plugins.configs.gitsigns") })
	use("tpope/vim-fugitive")
	use("christoomey/vim-tmux-navigator")
	use({ "windwp/nvim-autopairs", config = require("plugins.configs.autopairs") })
	use({ "sindrets/diffview.nvim" })
	use({ "RRethy/vim-illuminate" })
	use({ "ggandor/leap.nvim", config = require("plugins.configs.leap") })
	use({ "rcarriga/nvim-notify" })
	use({ "lukas-reineke/indent-blankline.nvim", config = require("plugins.configs.indent-blankline") })

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
	use({ "williamboman/mason.nvim" })
	use({ "williamboman/mason-lspconfig.nvim" })
	use({ "neovim/nvim-lspconfig" })
	use({ "jose-elias-alvarez/null-ls.nvim" })
	use({ "folke/trouble.nvim", config = require("plugins.configs.trouble") })

	-- colorscheme
	use({ "ellisonleao/gruvbox.nvim" })
	use({ "sainnhe/gruvbox-material" })
	use({ "luisiacc/gruvbox-baby" })

	-- comments
	use({ "numToStr/Comment.nvim", config = require("plugins.configs.comment") })
	use({ "JoosepAlviste/nvim-ts-context-commentstring" })
end)
