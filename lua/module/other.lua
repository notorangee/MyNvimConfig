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

-- TODO: nvim-gps
function other.nvimgps()
  require("nvim-gps").setup()
end

-- TODO: auto-tag
function other.autotag()
  require('nvim-ts-autotag').setup()
end

-- TODO: indent-blankline
function other.blankline()
  vim.opt.termguicolors = true
  vim.cmd [[highlight IndentBlanklineIndent1 guifg=#7A6E80 gui=nocombine]]
  --vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
  --vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
  --vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
  --vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
  --vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

  require("indent_blankline").setup {
      space_char_blankline = " ",
      char_highlight_list = {
          "IndentBlanklineIndent1",
          --"IndentBlanklineIndent2",
          --"IndentBlanklineIndent3",
          --"IndentBlanklineIndent4",
          --"IndentBlanklineIndent5",
          --"IndentBlanklineIndent6",
      },
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
