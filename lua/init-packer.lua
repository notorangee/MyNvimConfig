return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- BasePlug
  use 'kyazdani42/nvim-web-devicons'
  use "nvim-lua/plenary.nvim"

  -- gruvbox
  use 'morhetz/gruvbox'

  -- alpha-nvim
  use {
      'goolord/alpha-nvim',
  }
  -- treesitter
  use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
  }

  -- treesitter-context
  use 'nvim-treesitter/nvim-treesitter-context'

  use {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
  }

  -- lualine
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- language server protocol
  use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-calc'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'petertriho/cmp-git'
  use 'tzachar/fuzzy.nvim'
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
  use 'tzachar/cmp-fuzzy-buffer'
  use 'tzachar/cmp-fuzzy-path'
  use 'lukas-reineke/cmp-rg'
  use 'tamago324/cmp-zsh'

  -- java
  use 'mfussenegger/nvim-jdtls'

  -- lspsaga
  use 'kkharji/lspsaga.nvim'

  -- symbols-outline
  use 'simrat39/symbols-outline.nvim'

  -- null-ls
  use ({
    'jose-elias-alvarez/null-ls.nvim',
    requires = { "nvim-lua/plenary.nvim" },
})

  -- Snippets
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use({"L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*"})
  --use 'SirVer/ultisnips'
  --use 'quangnguyen30192/cmp-nvim-ultisnips'
  --use 'hrsh7th/cmp-vsnip'
  --use 'hrsh7th/vim-vsnip'
  --use 'dcampos/nvim-snippy'
  --use 'dcampos/cmp-snippy'

  -- nvim-gps
  use {
  	"SmiteshP/nvim-gps",
  	requires = "nvim-treesitter/nvim-treesitter"
  }

  -- auto-tag
  use 'windwp/nvim-ts-autotag'

  -- auto-pairs
  use 'windwp/nvim-autopairs'

  -- nvim-tree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }
  -- undotree
  use 'mbbill/undotree'

  -- surround
  use 'tpope/vim-surround'

  -- rainbow
  use 'luochen1990/rainbow'

  -- wildfire
  use 'gcmt/wildfire.vim'

  -- rooter
  use 'airblade/vim-rooter'

  -- markdown-preview
  use({
      "iamcco/markdown-preview.nvim",
      run = function() vim.fn["mkdp#util#install"]() end,
  })

  -- vim-table-mode
  use 'dhruvasagar/vim-table-mode'

  -- vim-visual-multi
  use 'mg979/vim-visual-multi'

  -- nerd commenter
  use 'preservim/nerdcommenter'

  -- leaderF
  use { 
    'Yggdroot/LeaderF',
    run = ':LeaderfInstallCExtension'
  }

  -- vim-cursorword
  use 'itchyny/vim-cursorword'

  -- codeformat
  use 'mhartington/formatter.nvim'
  --use 'google/vim-codefmt'
  --use 'google/vim-maktaba'
  --use 'google/vim-glaive'

  -- tagbar
  use 'preservim/tagbar'

  -- boolean switch
  use 'AndrewRadev/switch.vim'

  -- toggleterm
  use {
    "akinsho/toggleterm.nvim",
    tag = '*', config = function()
      require("toggleterm").setup()
    end
  }

  -- spectre
  use 'windwp/nvim-spectre'

  -- git
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }
  -- todo
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim"
  }
  -- colorizer
  use 'norcalli/nvim-colorizer.lua'

  -- trouble
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons"
  }

  -- winshift
  use 'sindrets/winshift.nvim'

  -- tanslator
  use 'voldikss/vim-translator'

  -- indent-blankline
  use 'lukas-reineke/indent-blankline.nvim'


end)
