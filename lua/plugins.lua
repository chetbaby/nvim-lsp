local vim = vim

-- INSTALLS PACKER IF NOT PRESENT
-- local execute = vim.api.nvim_command
-- local fn = vim.fn
-- local install_path = fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"
-- print("install path", install_path)
-- if fn.empty(fn.glob(install_path)) > 0 then
-- 	execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
-- 	execute("packadd packer.nvim")
-- end

-- vim.cmd("packadd packer.nvim")

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

function Get_config(name)
	return string.format('require("%s")', name)
end

-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-- PLUGINS $$$$$$$$$$$$$$$$$$$$$$$$$$$
-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

return packer.startup(function()
	use("wbthomason/packer.nvim")

	-- UI
	use("morhetz/gruvbox")

	-- CONTROLS
	use("tpope/vim-commentary")
	use("tpope/vim-fugitive")
	use({
		"kyazdani42/nvim-tree.lua",
		config = function()
			require("config/nvim-tree")
		end,
		requires = { { "kyazdani42/nvim-web-devicons" } },
	})

	-- LOCATE+RETRIEVE
	use({
		"ThePrimeagen/harpoon",
		requires = { { "nvim-lua/plenary.nvim" } },
		config = function()
			require("config/harpoon")
		end,
	})

	-- LSP
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-cmdline" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
		},
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
