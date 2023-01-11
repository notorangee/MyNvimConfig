local other = {}

-- TODO: rainbow
function other.rainbow()
  vim.g.rainbow_active = 1
end

-- TODO: rooter
function other.rooter()
  vim.g.rooter_patterns          = { '=src', '=java', '.git', 'Makefile', 'makefile' }
  vim.g.rooter_targets           = '/,*.c,*.h,*.java'
  vim.g.JavaComplete_ImportOrder = { 'com.','Java.','Javax.' }
  vim.g.rooter_change_directory_for_non_project_files = 'current'
end

-- TODO: nerd-commenter
function other.nerdcommenter()
  vim.g.NERDCreateDefaultMappings = 0
  vim.g.NERDSpaceDelims = 0
  vim.g.NERDCompactSexyComs = 1
  vim.g.NERDDefaultAlign = 'left'
  vim.g.NERDAltDelims_java = 1
  vim.cmd([[
    let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
  ]])
  vim.g.NERDCommentEmptyLines = 1
  vim.g.NERDTrimTrailingWhitespace = 1
  vim.g.NERDToggleCheckAllLines = 1
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
    direction = 'float',
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
