vim.cmd[[packadd packer.nvim]]
return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	use { 'nvim-telescope/telescope.nvim', tag = '0.1.5', requires = { {'nvim-lua/plenary.nvim'} } }

	--pair braces
	use {
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} end
	}

	-- Rust LSP 
	use 'simrat39/rust-tools.nvim'
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end,
	}
	use("nvim-treesitter/nvim-treesitter-context");
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v1.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-path'},
			{'saadparwaiz1/cmp_luasnip'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/cmp-nvim-lua'},

			-- Snippets
			{'L3MON4D3/LuaSnip'},
			{'rafamadriz/friendly-snippets'},
		}
	}

	use("theprimeagen/harpoon")
	use("theprimeagen/refactoring.nvim")
	use("mbbill/undotree")
	use("tpope/vim-fugitive")

	-- Rust error handling
	use({
		"folke/trouble.nvim",
		config = function()
			require("trouble").setup {
				icons = true,
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			}
		end,
		requires = { "nvim-tree/nvim-web-devicons" },
	})
	
	
	--Pull terminal up
	use 'voldikss/vim-floaterm'
    
    --tab bar 
    use 'romgrk/barbar.nvim'

    -- rooter
    use 'airblade/vim-rooter'

    --goto-preview
    use {
    'rmagatti/goto-preview',
     config = function()
             require('goto-preview').setup {}
         end
    }
    
    -- status bar
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    -- Theme
	use({
		'AlexvZyl/nordic.nvim',
		as = 'nordic',
		config = function()
            vim.cmd('colorscheme nordic')
		end
	})

end)
