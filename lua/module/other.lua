local other = {}

-- TODO: rooter
function other.rooter()
  vim.g.rooter_patterns          = { '=src', '=java', '.git', 'Makefile', 'makefile' }
  vim.g.rooter_targets           = '/,*.*'
  vim.g.JavaComplete_ImportOrder = { 'com.','Java.','Javax.' }
  vim.g.rooter_change_directory_for_non_project_files = 'current'
end

-- TODO: comment
function other.comment()
  require('Comment').setup{
    ---Add a space b/w comment and the line
    padding = true,
    ---Whether the cursor should stay at its position
    sticky = true,
    ---Lines to be ignored while (un)comment
    ignore = nil,
    ---LHS of toggle mappings in NORMAL mode
    toggler = {
        ---Line-comment toggle keymap
        line = '<leader>cc',
        ---Block-comment toggle keymap
        block = '<leader>cs',
    },
    ---LHS of operator-pending mappings in NORMAL and VISUAL mode
    opleader = {
        ---Line-comment keymap
        line = '<leader>cc',
        ---Block-comment keymap
        block = '<leader>cs',
    },
    ---LHS of extra mappings
    extra = {
        ---Add comment on the line above
        above = '<leader>cO',
        ---Add comment on the line below
        below = '<leader>co',
        ---Add comment at the end of line
        eol = '<leader>ca',
    },
    ---Enable keybindings
    ---NOTE: If given `false` then the plugin won't create any mappings
    mappings = {
        ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
        basic = true,
        ---Extra mapping; `gco`, `gcO`, `gcA`
        extra = true,
    },
    ---Function to call before (un)comment
    pre_hook = nil,
    ---Function to call after (un)comment
    post_hook = nil,
  }
end

-- TODO: vim-cursorword
function other.cursorword()
  vim.g.cursorword = 1
  vim.g.cursorword_delay = 300
  vim.g.cursorword_highlight = 1
end

-- TODO: boolean switch
function other.booleanswitch()
  vim.g.switch_mapping = "sw"
end

-- TODO: toggleterm
function other.toggleterm()
  require'toggleterm'.setup {
    shade_terminals = false,
    start_in_insert = true,
    insert_mappings = true,
    terminal_mappings = true,
    persist_size = true,
    persist_mode = true,
    shell = vim.o.shell,
    direction = 'vertical',
  }
end
-- TODO: colorizer
function other.colorizer()
  require 'colorizer'.setup ({
    'css';
    'javascript';
    html = {
      mode = 'background';
    }},
    {
      --mode = 'foreground'
      mode = 'background'
    }
  )
end

-- TODO: auto-tag
function other.autotag()
  require('nvim-ts-autotag').setup()
end

-- TODO: indent-blankline
function other.blankline()
  require('mini.indentscope').setup{
     -- Draw options
  draw = {
    -- Delay (in ms) between event and start of drawing scope indicator
    delay = 100,

    -- Animation rule for scope's first drawing. A function which, given
    -- next and total step numbers, returns wait time (in ms). See
    -- |MiniIndentscope.gen_animation| for builtin options. To disable
    -- animation, use `require('mini.indentscope').gen_animation.none()`.
    -- animation =  --<function: implements constant 20ms between steps>,

    -- Symbol priority. Increase to display on top of more symbols.
    priority = 2,
  },

  -- Module mappings. Use `''` (empty string) to disable one.
  mappings = {
    -- Textobjects
    object_scope = '',
    object_scope_with_border = '',

    -- Motions (jump to respective border line; if not present - body line)
    goto_top = '[i',
    goto_bottom = ']i',
  },

  -- Options which control scope computation
  options = {
    -- Type of scope's border: which line(s) with smaller indent to
    -- categorize as border. Can be one of: 'both', 'top', 'bottom', 'none'.
    border = 'both',

    -- Whether to use cursor column when computing reference indent.
    -- Useful to see incremental scopes with horizontal cursor movements.
    indent_at_cursor = true,

    -- Whether to first check input line to be a border of adjacent scope.
    -- Use it if you want to place cursor on function header to get scope of
    -- its body.
    try_as_border = false,
  },

  -- Which character to use for drawing scope indicator
  symbol = '╎',
  }
end

-- TODO: hop
function other.hop()
  require'hop'.setup {
    keys = 'etovxqpdygfblzhckisuran'
  }
end

-- TODO: gitsigns
function other.gitsigns()
  require("gitsigns").setup()
end

return other
