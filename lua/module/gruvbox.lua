-- gruvbox配色主题
vim.cmd([[
  set termguicolors
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  colorscheme gruvbox
  set background=dark
  hi! Normal ctermbg=NONE guibg=NONE
  hi! NonText ctermbg=NONE guibg=NONE
]])

