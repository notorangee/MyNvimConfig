local other = require("module.other")

return {

	-- BasePlug
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },
  
  {
    "nvim-lua/plenary.nvim",
    lazy = true,
  },
  
	-- gruvbox
	{
    "sainnhe/gruvbox-material",
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

  {
    "p00f/nvim-ts-rainbow",
    event = "BufRead",
  },

	-- treesitter-context
	{
    "nvim-treesitter/nvim-treesitter-context",
    lazy = true,
  },

	{
		"phaazon/hop.nvim",
		branch = "v2", -- optional but strongly recommended
    config = other.hop,
    keys = {
      {"fs", "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", mode = {"n", "v"}, silent = true}, 
      {"Fs", "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", mode = {"n", "v"}, silent = true}, 
      {"fS", "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false})<cr>", mode = {"n", "v"}, silent = true}, 
      {"FS", "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false})<cr>", mode = {"n", "v"}, silent = true}, 
    },
	},

	-- lualine
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {{  "nvim-tree/nvim-web-devicons", opt = true  }},
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
    event = "BufRead",
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
		dependencies = { { "nvim-lua/plenary.nvim" }, { 'nvim-telescope/telescope-fzf-native.nvim' } },
    config = function()
      require("module.telescope")
    end,
    keys = {
      {"ff", "<cmd>Telescope find_files<cr>", silent = true},
      {"fg", "<cmd>Telescope live_grep<cr>", silent = true},
      {"fl", "<cmd>Telescope current_buffer_fuzzy_find<cr>", silent = true},
      {"fb", "<cmd>Telescope buffers initial_mode=normal<cr>", silent = true},
      {"fh", "<cmd>Telescope help_tags<cr>", silent = true},
      {"fk", "<cmd>Telescope keymaps<cr>", silent = true},
      {"fc", "<cmd>Telescope git_commits initial_mode=normal<cr>", silent = true},
      {"fw", "<cmd>Telescope grep_string initial_mode=normal<cr>", silent = true},
      {"<leader>fw", '"zy:Telescope live_grep default_text=<C-r>z initial_mode=normal<cr>', mode="v", silent = true},
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
    dependencies = {{ 'nvim-telescope/telescope-fzf-native.nvim' }},
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
    "glepnir/lspsaga.nvim",
    dependencies = { {"nvim-tree/nvim-web-devicons"} },
    config = function()
      require("lsp.lspsaga")
    end,
    keys = {
      { "ga", "<cmd>Lspsaga code_action<cr>", mode = {"n", "v"}, silent = true },
      -- { "<leader>ga", ":<c-u>Lspsaga range_code_action<cr>", silent = true },
      {"rn", "<cmd>Lspsaga rename<cr>", silent = true},
      {"gr", "<cmd>Lspsaga lsp_finder<cr>", silent = true},
      {"<C-h>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", mode = {"n", "i"}, silent = true},
      {"gk", "<cmd>Lspsaga hover_doc<cr>", silent = true},
      {"go", "<cmd>Lspsaga outline<cr>", silent = true},
      {"gd", "<cmd>Lspsaga goto_definition<cr>", silent = true},
      {"gD", "<cmd>Lspsaga peek_definition<cr>", silent = true},
      {'gt', vim.lsp.buf.type_definition, silent = true},
      {"gi", vim.lsp.buf.implementation, silent = true},
      {"ge", "<cmd>Lspsaga show_line_diagnostics<cr>", mode = {"n", "v"}, silent = true},
      {"g]", "<cmd>Lspsaga diagnostic_jump_next<cr>", silent = true},
      {"g[", "<cmd>Lspsaga diagnostic_jump_prev<cr>", silent = true},
    },
    event = "BufRead",
  },

	-- Snippets
  {
    "saadparwaiz1/cmp_luasnip", -- Snippets source for nvim-cmp
    event = "BufRead",
  },

  {
    "L3MON4D3/LuaSnip",
   --  version = "<CurrentMajor>.*",
	  -- build = "make install_jsregexp",
    config = function()
      require("module.luasnip")
    end,
    event = "BufRead",
  },

	-- nvim-gps
	{
		"AvavaAvaOrange/nvim-gps",
		dependencies = { { "nvim-treesitter/nvim-treesitter" } },
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
			{ "nvim-tree/nvim-web-devicons" }, -- optional, for file icons
		},
		tag = "nightly", -- optional, updated every week. (see issue #1193,
    config = function()
      require("module.nvimtree")
    end,
    keys = {{"<F1>", "<cmd>NvimTreeToggle<cr>", silent = true}},
	},

	-- undotree
  {
    "mbbill/undotree",
    config = function()
      require("module.undotree")
    end,
    keys = {{"<F2>", "<cmd>UndotreeToggle<cr>", silent = true}},
  },

	-- surround
  {
    "tpope/vim-surround",
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
    config = other.rooter,
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
    ft = "markdown",
	},

	-- vim-table-mode
  {
    "dhruvasagar/vim-table-mode",
    keys = {{"tm", "<cmd>TableModeToggle<cr>", silent = true}},
  },

	-- vim-visual-multi
  {
    "mg979/vim-visual-multi",
    event = "BufRead",
  },

	-- comment
  {
    'numToStr/Comment.nvim',
    config = other.comment,
    event = "BufRead",
  },

	-- vim-cursorword
  {
    "itchyny/vim-cursorword",
    config = other.cursorword,
    event = "BufRead",
  },

	-- codeformat
  {
    "mhartington/formatter.nvim",
    config = function()
      require("module.formatter")
    end,
    keys = {
      { "gs", "<cmd>Format<cr>", silent = true },
      { "gl", "<cmd>lua format_range_operator()<cr>", mode = { "n", "v" }, silent = true },
    }
  },

	-- tagbar
	{
    "preservim/tagbar",
    keys = {{"<F5>", "<cmd>TagbarToggle<cr>", silent = true}},
  },

	-- boolean switch
	{
    "AndrewRadev/switch.vim",
    config = other.booleanswitch,
    keys = {{"sw", "<cmd>Switch<cr>", mode = {"n", "v"}, silent = true}},
  },

	-- toggleterm
  {
    "akinsho/toggleterm.nvim",
    config = other.toggleterm,
    keys = {{"TT", "<cmd>ToggleTerm size=60 dir=%:p:h <cr>", silent = true}},
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
    config = other.gitsigns,
    event = "BufRead",
  },

	-- todo
	{
		"folke/todo-comments.nvim",
		dependencies = { { "nvim-lua/plenary.nvim" } },
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
    config = other.colorizer,
    event = "BufRead",
  },

	-- trouble
	{
		"folke/trouble.nvim",
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
    config = function()
      require("module.trouble")
    end,
    keys = {{"gx", "<cmd>TroubleToggle<cr>", silent = true}},
	},

	-- winshift
  {
    "sindrets/winshift.nvim",
    keys = {{"wm", "<cmd>WinShift<cr>", silent = true}},
  },

	-- tanslator
  {
      "JuanZoran/Trans.nvim",
      build = function() require('Trans').install() end,
      keys = {
      -- 可以换成其他你想映射的键
          { 'tt', mode = { 'n', 'x' }, '<Cmd>Translate<CR>', desc = ' Translate' },
          { 'ts', mode = { 'n', 'x' }, '<Cmd>TransPlay<CR>', desc = ' Auto Play' },
          -- 目前这个功能的视窗还没有做好，可以在配置里将view.i改成hover
          { 'ti', '<Cmd>TranslateInput<CR>', desc = ' Translate From Input' },
      },
      dependencies = { 'kkharji/sqlite.lua', },
      opts = require ("module.trans"),
      event = "BufRead",
  },

	-- indent-blankline
  {
    "lukas-reineke/indent-blankline.nvim",
    config = other.blankline,
    event = "BufRead",
  },

  -- {
  --   "lvimuser/lsp-inlayhints.nvim",
  --   config = function()
  --     require("lsp.inlayhints")
  --   end,
  --   event = "LspAttach",
  -- },
  {
    "kkharji/sqlite.lua",
    lazy = true,
  },
  -- {
  --   "folke/which-key.nvim",
  --   config = function()
  --     require("module.whichkey")
  --   end,
  -- },
}
