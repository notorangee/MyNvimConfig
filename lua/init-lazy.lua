local other_config = require("module.other")
vim.g.mapleader = ' ' -- 在初始化lazy前映射leader

require("lazy").setup({

	-- BasePlug
  {
    "kyazdani42/nvim-web-devicons",
    lazy = true,
  },
  
  {
    "nvim-lua/plenary.nvim",
    lazy = true,
  },
  
	-- gruvbox
	{
    "morhetz/gruvbox",
    config = function()
      require("module.gruvbox")
    end,
    event = "VimEnter",
  },

	-- alpha-nvim
	{
		"goolord/alpha-nvim",
    config = function()
      require("module.alpha")
    end,
    event = "VimEnter",
	},

	-- treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
    config = function()
      require("module.treesitter")
    end,
    event = "VimEnter",
	},

	-- treesitter-context
	{
    "nvim-treesitter/nvim-treesitter-context",
    lazy = true,
  },

	{
		"phaazon/hop.nvim",
		branch = "v2", -- optional but strongly recommended
    config = other_config.hop,
    keys = {
      {"fs", "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", silent = true},
      {"Fs", "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", silent = true},
      {"fS", "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false})<cr>", silent = true},
      {"FS", "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false})<cr>", silent = true},
    },
	},

	-- lualine
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons", opt = true },
    config = function()
      require("module.lualine")
    end,
    event = "UIEnter",
	},

	-- language server protocol
  {
	  "neovim/nvim-lspconfig", -- Collection of configurations for built-in LSP client
    lazy = true,
  },
	{
    "williamboman/mason.nvim",
    config = function()
      require("lsp.mason")
    end,
    lazy = true,
  },
	{
    "williamboman/mason-lspconfig.nvim",
    lazy = true,
  },

  {
	  "hrsh7th/nvim-cmp", -- Autocompletion plugin
    config = function()
      require("lsp.cmp")
    end,
    event = "BufRead",
  },
	{
    "hrsh7th/cmp-buffer",
    lazy = true,
  },
	{
    "hrsh7th/cmp-path",
    lazy = true,
  },
	{
    "hrsh7th/cmp-calc",
    lazy = true,
  },
	{
    "hrsh7th/cmp-cmdline",
    lazy = true,
  },
  {
	  "hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
    lazy = true,
  },
	{
    "hrsh7th/cmp-nvim-lsp-signature-help",
    lazy = true,
  },
	{
    "petertriho/cmp-git",
    lazy = true,
  },
	{
    "tzachar/cmp-fuzzy-buffer",
    lazy = true,
  },
	{
    "tzachar/cmp-fuzzy-path",
    lazy = true,
  },
	{
    "lukas-reineke/cmp-rg",
    lazy = true,
  },
	{
    "tamago324/cmp-zsh",
    lazy = true,
  },

  -- telescope
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = { "nvim-lua/plenary.nvim", 'nvim-telescope/telescope-fzf-native.nvim' },
    config = function()
      require("module.telescope")
    end,
    keys = {
      {"ff", "<cmd>Telescope find_files<cr>", silent = true},
      {"fg", "<cmd>Telescope live_grep<cr>", silent = true},
      {"fl", "<cmd>Telescope current_buffer_fuzzy_find<cr>", silent = true},
      {"fb", "<cmd>Telescope buffers<cr>", silent = true},
      {"fh", "<cmd>Telescope help_tags<cr>", silent = true},
      {"fk", "<cmd>Telescope keymaps<cr>", silent = true},
      {"fc", "<cmd>Telescope git_commits<cr>", silent = true},
    },
    event = "UIEnter",
	},

	{
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    lazy = true,
  },

  {
    'tzachar/fuzzy.nvim',
    dependencies = {'nvim-telescope/telescope-fzf-native.nvim'},
    lazy = true,
  },

	-- java
	{
    "mfussenegger/nvim-jdtls",
    config = function()
      require("lsp.java")
    end,
    ft = "java",
  },

	-- lspsaga
  {
    "kkharji/lspsaga.nvim",
    config = function()
      require("lsp.lspsaga")
    end,
    keys = {
      { "ga", "<cmd>Lspsaga code_action<cr>", silent = true },
      { "<leader>ga", ":<c-u>Lspsaga range_code_action<CR>", silent = true },
      {"rn", "<cmd>Lspsaga rename<cr>", silent = true},
      {"gr", "<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>", silent = true},
      {"<C-h>", "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>", mode = {"n", "i"}, silent = true},
      {"gk", "<cmd>Lspsaga hover_doc<CR>", silent = true},
      {"gd", vim.lsp.buf.definition, silent = true},
      {'gt', vim.lsp.buf.type_definition, silent = true},
      {"gi", vim.lsp.buf.implementation, silent = true},
      {"ge", "<cmd>Lspsaga show_line_diagnostics<CR>", mode = {"n", "v"}, silent = true},
      {"g]", "<cmd>Lspsaga diagnostic_jump_next<CR>", silent = true},
      {"g[", "<cmd>Lspsaga diagnostic_jump_prev<CR>", silent = true},
      {"<C-j>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", mode = {"n", "i"}, silent = true},
      {"<C-k>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", mode = {"n", "i"}, silent = true},
    },
    event = "BufRead",
  },

	{
    "simrat39/symbols-outline.nvim",
    config = function()
      require("module.outline")
    end,
    keys = {{"go", "<cmd>SymbolsOutline<CR>", mode = {"n", "v"}, silent = true}},
  },

	-- Snippets
  {
    "saadparwaiz1/cmp_luasnip", -- Snippets source for nvim-cmp
    event = "BufRead",
  },

  {
    "L3MON4D3/LuaSnip",
    config = function()
      require("module.luasnip")
    end,
    event = "BufRead",
  },

	-- nvim-gps
	{
		"SmiteshP/nvim-gps",
		dependencies = "nvim-treesitter/nvim-treesitter",
    config = other_config.nvimgps,
    event = "BufRead",
	},

	-- auto-tag
  {
    "windwp/nvim-ts-autotag",
    event = "BufRead",
  },

	-- auto-pairs
  {
    "windwp/nvim-autopairs",
    config = function()
      require("module.autopairs")
    end,
    event = "InsertEnter",
  },

	-- nvim-tree
	{
		"kyazdani42/nvim-tree.lua",
		dependencies = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icons
		},
		tag = "nightly", -- optional, updated every week. (see issue #1193,
    config = function()
      require("module.nvimtree")
    end,
    keys = {{"<F1>", ":NvimTreeToggle<cr>", silent = true}},
	},

	-- undotree
  {
    "mbbill/undotree",
    config = function()
      require("module.undotree")
    end,
    keys = {{"<F2>", ":UndotreeToggle<CR>", silent = true}},
  },

	-- surround
  {
    "tpope/vim-surround",
    event = "BufRead",
  },

	-- rainbow
	{
    "luochen1990/rainbow",
    config = other_config.rainbow,
    event = "BufRead",
  },

	-- wildfire
  {
    "gcmt/wildfire.vim",
    keys = {{"<leader><leader>", "<Plug>(wildfire-fuel)", mode = {"n", "v"}, silent = true}},
  },

	-- rooter
  {
    "airblade/vim-rooter",
    config = other_config.rooter,
    event = "BufRead",
  },

	-- markdown-preview
	{
		"iamcco/markdown-preview.nvim",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
    config = function()
      require("module.markdown")
    end,
    event = "BufRead",
    keys = {{"<F3>"}},
	},

	-- vim-table-mode
  {
    "dhruvasagar/vim-table-mode",
    keys = {{"tm", ":TableModeToggle<CR>", silent = true}},
  },

	-- vim-visual-multi
  {
    "mg979/vim-visual-multi",
    event = "BufRead",
  },

	-- nerd commenter
  {
    "preservim/nerdcommenter",
    config = other_config.nerdcommenter,
    keys = {
      {"<leader>cc", "<plug>NERDCommenterComment", mode = {"n", "v"}, silent = true},
      {"<leader>cs", "<plug>NERDCommenterToggle", mode = {"n", "v"}, silent = true},
      {"<leader>cA", "<plug>NERDCommenterAppend", mode = {"n", "v"}, silent = true},
    },
    event = "BufRead",
  },

	-- vim-cursorword
  {
    "itchyny/vim-cursorword",
    config = other_config.cursorword,
    event = "BufRead",
  },

	-- codeformat
  {
    "mhartington/formatter.nvim",
    config = function()
      require("module.formatter")
    end,
    keys = {
      {"gs", "<cmd>lua vim.lsp.buf.formatting()<cr>1<cr><cr>", silent = true},
      {"gl", "<cmd>lua vim.lsp.buf.range_formatting()<cr>1<cr><ESC>", mode = {"n", "v"}, silent = true},
    }
  },

	-- tagbar
	{
    "preservim/tagbar",
    keys = {{"<F5>", ":TagbarToggle<CR>", silent = true}},
  },

	-- boolean switch
	{
    "AndrewRadev/switch.vim",
    config = other_config.booleanswitch,
    keys = {{"sw", silent = true}},
    event = "BufRead",
  },

	-- toggleterm
  {
    "akinsho/toggleterm.nvim",
    config = other_config.toggleterm,
    keys = {{"TT", ":ToggleTerm size=10 dir=%:p:h <CR>", silent = true}},
  },

	-- spectre
  {
    "windwp/nvim-spectre",
    keys = {
      {"<leader>ss", function() require("spectre").open() end, silent = true},
      {"<leader>sw", function() require("spectre").open_visual({ select_word = true }) end, silent = true},
      {"<leader>sw", function() require("spectre").open_visual() end, mode = "v", silent = true},
      {"<leader>sf", function() require("spectre").open_file_search() end, silent = true}
    },
  },

	-- git
  {
    "lewis6991/gitsigns.nvim",
    config = other_config.gitsigns,
    event = "BufRead",
  },

	-- todo
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("module.todocomments")
    end,
    keys = {
      {"t]", function() require("todo-comments").jump_next() end, desc = "Next todo comment", silent = true},
      {"t[", function() require("todo-comments").jump_prev() end, desc = "Previous todo comment", silent = true},
    },
    event = "BufRead",
	},

	-- colorizer
  {
    "norcalli/nvim-colorizer.lua",
    config = other_config.colorizer,
    ft = {"css", "html", "js"},
  },

	-- trouble
	{
		"folke/trouble.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons" },
    config = function()
      require("module.trouble")
    end,
    keys = {{"gx", "<cmd>TroubleToggle<cr>", silent = true}},
	},

	-- winshift
  {
    "sindrets/winshift.nvim",
    keys = {{"wm", "<Cmd>WinShift<CR>", silent = true}},
  },

	-- tanslator
  {
    "voldikss/vim-translator",
    config = function()
      require("module.translator")
    end,
    keys = {
      {"tt", "<Plug>Translate", silent = true},
      {"<leader>tv", "<Plug>TranslateV", mode = "v", silent = true},
      {"tw", "<Plug>TranslateW", silent = true},
      {"<leader>tw", "<Plug>TranslateWV", mode = "v", silent = true},
      {"tr", "<Plug>TranslateR", silent = true},
      {"tx", "<Plug>TranslateX", silent = true},
      {"te", "<Plug>Translate :call TranslatorSpeak(v:false)<CR>", silent = true},
      {"<leader>te", "<Plug>TranslateV :call TranslatorSpeak(v:true)<CR>", mode = "v", silent = true},
      {"ts", ":call TranslatorSpeak(v:false)<CR>", silent = true},
      {"<leader>ts", ":call TranslatorSpeak(v:true)<CR>", mode = "v", silent = true},
    },
  },

	-- indent-blankline
  {
    "lukas-reineke/indent-blankline.nvim",
    config = other_config.blankline,
    event = "BufRead",
  },
})
