local vim = vim

-- INSTALLS PACKER IF NOT PRESENT
--[[ local execute = vim.api.nvim_command ]]
--[[ local fn = vim.fn ]]
--[[ local install_path = fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim" ]]
--[[ print("install path", install_path) ]]
--[[ if fn.empty(fn.glob(install_path)) > 0 then ]]
--[[ 	execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path) ]]
--[[ 	execute("packadd packer.nvim") ]]
--[[ end ]]

vim.cmd("packadd packer.nvim")

-- PROTECTED CALL
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- RELOAD WHENEVER plugins.lua IS SAVED
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- PACKER POPUP WINDOW
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

--       _             _
--      | |           (_)
-- _ __ | |_   _  __ _ _ _ __  ___
--| '_ \| | | | |/ _` | | '_ \/ __|
--| |_) | | |_| | (_| | | | | \__ \
--| .__/|_|\__,_|\__, |_|_| |_|___/
--| |             __/ |
--|_|            |___/

return packer.startup(function()
	use("wbthomason/packer.nvim")

	--  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	-- UI                 
	--  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	use({
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup()
		end,
	})
	use("folke/lsp-colors.nvim")
	use({
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		event = "BufReadPre",
		config = function()
			require("config/gitsigns")
		end,
	})
	use({
		"norcalli/nvim-colorizer.lua",
		event = "BufReadPre",
		config = function()
			require("config/colorizer")
		end,
	})
	use("morhetz/gruvbox")
	use("Yggdroot/indentLine")
	use("machakann/vim-highlightedyank")
	use("p00f/nvim-ts-rainbow")
	use("EdenEast/nightfox.nvim")
	use("savq/melange")
	use("sainnhe/sonokai")
	use("sainnhe/everforest")
	use("folke/tokyonight.nvim")
	use("joshdick/onedark.vim")
	use("dracula/vim")
	use({
		"akinsho/nvim-bufferline.lua",
		tag = "v2.*",
		requires = "kyazdani42/nvim-web-devicons",
		event = "BufReadPre",
		config = function()
			require("config/bufferline")
		end,
	})
	use({
		"nvim-lualine/lualine.nvim",
		config = function()
			require("config/lualine")
		end,
		event = "VimEnter",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})
	use({
		"rcarriga/nvim-notify", -- don't know how to use this
		config = function()
			require("config/notify")
		end,
	})
	-- Lua
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("config/trouble")
		end,
	})

	--  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	--  CONTROLS              
	--  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	use({
		"akinsho/nvim-toggleterm.lua",
		tag = "v2.*",
		keys = { "<C-y>", "<leader>fl", "<leader>gt" },
		config = function()
			require("config/toggleterm")
		end,
	})
	--[[ use({ ]]
	--[[ 	"Pocco81/auto-save.nvim", ]]
	--[[ 	config = function() ]]
	--[[ 		require("config/auto-save") ]]
	--[[ 	end, ]]
	--[[ }) ]]
	use({
		"rmagatti/auto-session",
		config = function()
			require("auto-session").setup({
				log_level = "info",
				auto_session_suppress_dirs = { "~/", "~/Projects" },
			})
		end,
	})
	use({
		"qpkorr/vim-bufkill",
		config = function()
			require("config/bufkill")
		end,
	})
	use("alvan/vim-closetag")
	use("AndrewRadev/tagalong.vim")
	use("jiangmiao/auto-pairs")
	use("Valloric/MatchTagAlways")
	use("JoosepAlviste/nvim-ts-context-commentstring") --for jsx comments
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("config/comment")
		end,
	})
	use("tpope/vim-surround")
	use("tpope/vim-rhubarb")
	use({
		"tpope/vim-fugitive",
		config = function()
			require("config/fugitive")
		end,
	})
	use({
		"kyazdani42/nvim-tree.lua",
		config = function()
			require("config/nvim-tree")
		end,
		requires = { { "kyazdani42/nvim-web-devicons" } },
	})
	use("romainl/vim-qf")

	--  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	-- LOCATE+RETRIEVE          
	--  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	use({
		"ThePrimeagen/harpoon",
		requires = { { "nvim-lua/plenary.nvim" } },
		config = function()
			require("config/harpoon")
		end,
	})
	use({
		"ibhagwan/fzf-lua",
		requires = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("config/fzf-lua")
		end,
	})

	--  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	-- LSP                
	--  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	use("ray-x/lsp_signature.nvim")
	use("rafamadriz/friendly-snippets")
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"saadparwaiz1/cmp_luasnip",
			"L3MON4D3/LuaSnip",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			require("config/cmp")
		end,
	})
	use({
		"nvim-treesitter/nvim-treesitter-context",
		config = function()
			require("config/treesitter-context")
		end,
	})
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			require("config/treesitter")
		end,
	})
	use({
		"neovim/nvim-lspconfig",
		requires = {
			"williamboman/nvim-lsp-installer",
			"jose-elias-alvarez/null-ls.nvim",
			"nvim-lua/plenary.nvim",
			"jose-elias-alvarez/nvim-lsp-ts-utils",
		},
		config = function()
			require("config/lsp")
		end,
	})
end)
