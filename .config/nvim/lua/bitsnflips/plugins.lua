-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd("packer.nvim")

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")
	use("tpope/vim-dispatch")

	-- Comments
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})

	use({ "mfussenegger/nvim-jdtls" })
	-- neotest
	use({
		"nvim-neotest/neotest",
		requires = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
	})

	-- neotest rust
	use({
		"rouge8/neotest-rust",
		requires = {
			"nvim-neotest/neotest",
		},
	})

	-- debugger
	use({
		"mfussenegger/nvim-dap",
		requires = {
			{
				-- Creates a beautiful debugger UI
				"rcarriga/nvim-dap-ui",
				-- Required dependency for nvim-dap-ui
				"nvim-neotest/nvim-nio",
				-- Installs the debug adapters for you
				"williamboman/mason.nvim",
				"jay-babu/mason-nvim-dap.nvim",
				"theHamsta/nvim-dap-virtual-text",
				-- Add your own debuggers here
				"leoluz/nvim-dap-go",
			},
		},
	})

	use("stevearc/conform.nvim")

	-- Fuzzy finder
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	--  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	})
	-- Gruvbox Colorscheme
	use({ "ellisonleao/gruvbox.nvim" })
	-- Tokyo Night Colorscheme
	use({ "folke/tokyonight.nvim" })

	-- Neovim Treesitter for better parsing
	use({ "nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" } })

	-- Git integration
	use("tpope/vim-fugitive")

	-- LSP setup
	use({
		"VonHeikemen/lsp-zero.nvim",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		},
	})

	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	--    use 'nvim-tree/nvim-tree.lua'
	use("tpope/vim-vinegar")
end)
