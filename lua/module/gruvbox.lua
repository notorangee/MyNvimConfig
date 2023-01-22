-- gruvbox配色主题
vim.o.termguicolors = true
vim.o.background = 'dark'
vim.g.gruvbox_material_background = 'soft'
vim.g.gruvbox_material_foreground = 'mix'
vim.g.gruvbox_material_better_performance = 1
vim.g.gruvbox_material_transparent_background = 1
vim.g.gruvbox_material_dim_inactive_windows = 1
vim.g.gruvbox_material_enable_bold = 1
vim.g.gruvbox_material_spell_foreground = 'colored'
vim.g.gruvbox_material_ui_contrast = 'high'
vim.g.gruvbox_material_diagnostic_line_highlight = 1
vim.cmd([[
  colorscheme gruvbox-material
]])
