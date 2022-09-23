--TODO: 第三方插件按键映射
local keymap = vim.keymap.set
local opts = {noremap = true, silent = true}
--TODO: NvimTree
keymap('n', '<F1>', ':NvimTreeToggle<CR>', opts)

--TODO: UndoTree
keymap('n', '<F2>', ':UndotreeToggle<CR>', opts)

--TODO: vim-table-mode
keymap('n', 'tm', ':TableModeToggle<CR>', opts)

--TODO: nerd-commenter
keymap('n', '<leader>cc', '<plug>NERDCommenterComment', opts)
keymap('v', '<leader>cc', '<plug>NERDCommenterComment', opts)
keymap('n', '<leader>cu', '<plug>NERDCommenterUncomment', opts)
keymap('v', '<leader>cu', '<plug>NERDCommenterUncomment', opts)
keymap('n', '<leader>cs', '<plug>NERDCommenterToggle', opts)
keymap('v', '<leader>cs', '<plug>NERDCommenterToggle', opts)
keymap('n', '<leader>ca', '<plug>NERDCommenterAltDelims', opts)
keymap('v', '<leader>ca', '<plug>NERDCommenterAltDelims', opts)
keymap('n', '<leader>cA', '<plug>NERDCommenterAppend', opts)
keymap('v', '<leader>cA', '<plug>NERDCommenterAppend', opts)

--TODO: leaderF
keymap('n', 'ff', ':Leaderf file<CR>', opts)
keymap('n', 'fo', ':Leaderf mru<CR>', opts)
keymap('n', 'fb', ':Leaderf buffer<CR>', opts)
keymap('n', 'fc', ':Leaderf function<CR>', opts)
keymap('n', 'fg', ':Leaderf rg<CR>', opts)
keymap('n', 'fl', ':Leaderf line<CR>', opts)

--TODO: formatCode
--keymap('n', 'gl', ':Format<CR>', opts)
keymap('n', 'gs', ':Format<CR>', opts)

--TODO: tagbar
keymap('n', '<F5>', ':TagbarToggle<CR>', opts)

--TODO: toggleterm
keymap('n', 'TT', ':ToggleTerm size=10 dir=%:p:h <CR>', opts)

--TODO: spectre
vim.keymap.set('n', '<leader>ss', function()
  require('spectre').open()
end, opts)
vim.keymap.set('n', '<leader>sw', function()
  require('spectre').open_visual({select_word=true})
end, opts)
vim.keymap.set('v', '<leader>sw', function()
  require('spectre').open_visual()
end, opts)
vim.keymap.set('n', '<leader>sf', function()
  require('spectre').open_file_search()
end, opts)

--TODO: todo-comments
vim.keymap.set("n", "t]", function()
  require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "t[", function()
  require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

--TODO: trouble
vim.keymap.set("n", "gx", "<cmd>TroubleToggle<cr>", opts)

--TODO: winshift
keymap('n', 'wm', '<Cmd>WinShift<CR>', opts)

--TODO: format
--keymap('n', 'fm', ':Format<CR>', opts)
keymap("n", "fm", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

--TODO: lspsaga
--- In lsp attach function
keymap({'n', 'v'}, "rn", "<cmd>Lspsaga rename<cr>", opts)
keymap({'n', 'v'}, "gr", "<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>", opts)
keymap("n", "ga", "<cmd>Lspsaga code_action<cr>", opts)
keymap("v", "ga", ":<c-u>Lspsaga range_code_action<CR>", opts)
keymap({'n', 'i'}, "<C-s>",  "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>", opts)
keymap({'n', 'v'}, "gk",  "<cmd>Lspsaga hover_doc<CR>", opts)
keymap({'n', 'v'}, "gd",  "<cmd>lua require'lspsaga.provider'.preview_definition()<CR>", opts)
keymap({'n', 'v'}, "gi",  "<cmd>Lspsaga implement<CR>", opts)
keymap({'n', 'v'}, "ge", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
keymap("n", "g]", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
keymap("n", "g[", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
keymap({'n', 'i'}, "<C-k>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1, '<c-u>')<CR>", {})
keymap({'n', 'i'}, "<C-j>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1, '<c-d>')<CR>", {})

-- TODO: translator
keymap('n', 'tt', '<Plug>Translate', opts)
keymap('v', 'tt', '<Plug>TranslateV', opts)
keymap('n', 'tw', '<Plug>TranslateW', opts)
keymap('v', 'tw', '<Plug>TranslateWV', opts)
keymap('n', 'tr', '<Plug>TranslateR', opts)

keymap('n', 'tx', '<Plug>TranslateX', opts)
-- 自定义
keymap('n', 'te', '<Plug>Translate :call TranslatorSpeak(v:false)<CR>', opts)
keymap('v', 'te', '<Plug>TranslateV :call TranslatorSpeak(v:true)<CR>', opts)
keymap('n', 'ts', ':call TranslatorSpeak(v:false)<CR>', opts)
keymap('v', 'ts', ':call TranslatorSpeak(v:true)<CR>', opts)


-- TODO: wildfire
keymap({'n', 'v'}, '<leader><leader>', '<Plug>(wildfire-fuel)', opts)


-- TODO: hop
-- place this in one of your configuration file(s)
keymap('', 'fs', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
keymap('', 'Fs', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})
keymap('', 'fS', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false})<cr>", {})
keymap('', 'FS', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false})<cr>", {})

-- TODO: outline
keymap({'n', 'v'}, 'go', '<cmd>SymbolsOutline<CR>', opts)

