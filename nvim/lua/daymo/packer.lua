-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use {'wbthomason/packer.nvim'}
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.5',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- colorschemes
  use { 'folke/tokyonight.nvim' }
  use { 'ellisonleao/gruvbox.nvim'}
  use({
	  'rose-pine/neovim'
	  -- 'rose-pine/neovim',
	  -- as = 'rose-pine',
	  -- config = function()
	  --         vim.cmd('colorscheme rose-pine')
	  -- end
  })
  use {'shaunsingh/nord.nvim'}
  use {'marko-cerovac/material.nvim'}

  -- navigation and git
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('mbbill/undotree')
  use('tpope/vim-fugitive')

  -- lsp
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  -- {'hrsh7th/cmp-buffer'},
		  -- {'hrsh7th/cmp-path'},
		  -- {'saadparwaiz1/cmp_luasnip'},
		  -- {'hrsh7th/cmp-nvim-lsp'},
		  -- {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  -- {'rafamadriz/friendly-snippets'},
	  }
  }
  use {"folke/zen-mode.nvim",}

  use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use {
      'nvim-tree/nvim-tree.lua',
      requires = {
          'nvim-tree/nvim-web-devicons', -- optional, for file icons
      },
      tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }
  use {
      "windwp/nvim-autopairs",
      config = function() require("nvim-autopairs").setup {} end
  }
  -- vim surround

  -- html stuff
  use {"windwp/nvim-ts-autotag",}
  use {"mattn/emmet-vim"}

  -- latex stuff
  use {'lervag/vimtex'}
  use {'mhinz/neovim-remote'}
  use { "nvim-telescope/telescope-bibtex.nvim",
      requires = {
          {'nvim-telescope/telescope.nvim'},
      },
  }
  use {'terrortylor/nvim-comment'}
  use {'kylechui/nvim-surround',
  tag = "*", -- Use for stability; omit to use 'main' branch for the latest feature
  }

end)
