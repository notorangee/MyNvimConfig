-- TODO: rainbow
vim.g.rainbow_active = 1

-- TODO: rooter
vim.g.rooter_patterns          = { '=src', '=java', '.git', 'Makefile' }
vim.g.rooter_targets           = '/,*.c,*.java'
vim.g.JavaComplete_ImportOrder = { 'com.','Java.','Javax.' }
vim.g.rooter_change_directory_for_non_project_files = 'current'

-- TODO: nerd-commenter
-- \cc ：注释当前行和选中行
-- \cu ：取消选中区域的注释
-- \cs ：没注释加注释，有注释就取消注释
-- \ca : 转换注释样式
-- \cA ：跳转行尾再进行注释
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

-- TODO: vim-cursorword
vim.g.cursorword = 1
vim.g.cursorword_delay = 300
vim.g.cursorword_highlight = 1

-- TODO: boolean switch
vim.g.switch_mapping = "sw"

-- TODO: toggleterm
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
-- TODO: colorizer
require 'colorizer'.setup {
  'css';
  'javascript';
  html = {
    mode = 'foreground';
  }
}

-- TODO: nvim-gps
require("nvim-gps").setup()

-- TODO: auto-tag
require('nvim-ts-autotag').setup()

-- TODO: indent-blankline
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

-- TODO: hop
    -- you can configure Hop the way you like here; see :h hop-config
require'hop'.setup {
  keys = 'etovxqpdygfblzhckisuran'
}

