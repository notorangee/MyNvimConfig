--TODO: 第三方插件按键映射
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
--TODO: NvimTree
keymap("n", "<F1>", ":NvimTreeToggle<CR>", opts)

--TODO: UndoTree
keymap("n", "<F2>", ":UndotreeToggle<CR>", opts)

--TODO: vim-table-mode
keymap("n", "tm", ":TableModeToggle<CR>", opts)

--TODO: nerd-commenter
keymap("n", "<leader>cc", "<plug>NERDCommenterComment", opts)
keymap("v", "<leader>cc", "<plug>NERDCommenterComment", opts)
keymap("n", "<leader>cu", "<plug>NERDCommenterUncomment", opts)
keymap("v", "<leader>cu", "<plug>NERDCommenterUncomment", opts)
keymap("n", "<leader>cs", "<plug>NERDCommenterToggle", opts)
keymap("v", "<leader>cs", "<plug>NERDCommenterToggle", opts)
keymap("n", "<leader>ca", "<plug>NERDCommenterAltDelims", opts)
keymap("v", "<leader>ca", "<plug>NERDCommenterAltDelims", opts)
keymap("n", "<leader>cA", "<plug>NERDCommenterAppend", opts)
keymap("v", "<leader>cA", "<plug>NERDCommenterAppend", opts)

-- TODO: Telescope
keymap("n", "ff", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "fg", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "fb", "<cmd>Telescope buffers<cr>", opts)
keymap("n", "fh", "<cmd>Telescope help_tags<cr>", opts)
keymap("n", "fk", "<cmd>Telescope keymaps<cr>", opts)
keymap("n", "fc", "<cmd>Telescope git_commits<cr>", opts)

--TODO: formatCode
--keymap('n', 'gl', ':Format<CR>', opts)
keymap("n", "gs", ":Format<CR>", opts)

--TODO: tagbar
keymap("n", "<F5>", ":TagbarToggle<CR>", opts)

--TODO: toggleterm
keymap("n", "TT", ":ToggleTerm size=10 dir=%:p:h <CR>", opts)

--TODO: spectre
vim.keymap.set("n", "<leader>ss", function()
	require("spectre").open()
end, opts)
vim.keymap.set("n", "<leader>sw", function()
	require("spectre").open_visual({ select_word = true })
end, opts)
vim.keymap.set("v", "<leader>sw", function()
	require("spectre").open_visual()
end, opts)
vim.keymap.set("n", "<leader>sf", function()
	require("spectre").open_file_search()
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
keymap("n", "wm", "<Cmd>WinShift<CR>", opts)

--TODO: format
--keymap('n', 'fm', ':Format<CR>', opts)
keymap("n", "gs", "<cmd>lua vim.lsp.buf.formatting()<cr>1<cr><cr>", opts)
keymap("n", "gl", "<cmd>lua vim.lsp.buf.range_formatting()<cr>1<cr><ESC>", opts)

--TODO: lspsaga
--- In lsp attach function
keymap("n", "ga", "<cmd>Lspsaga code_action<cr>", opts)
keymap("v", "<leader>ga", ":<c-u>Lspsaga range_code_action<CR>", opts)
keymap("n", "rn", "<cmd>Lspsaga rename<cr>", opts)
keymap("n", "gr", "<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>", opts)
keymap({ "n", "i" }, "<C-h>", "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>", opts)
keymap("n", "gk", "<cmd>Lspsaga hover_doc<CR>", opts)
keymap("n", "gd", vim.lsp.buf.definition, opts)
keymap("n", 'gt', vim.lsp.buf.type_definition, opts)
keymap("n", "gi", vim.lsp.buf.implementation, opts)
keymap("n", "ge", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
keymap("n", "g]", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
keymap("n", "g[", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
keymap({ "n", "i" }, "<C-j>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", opts)
keymap({ "n", "i" }, "<C-k>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", opts)

-- TODO: translator
keymap("n", "tt", "<Plug>Translate", opts)
keymap("v", "<leader>tv", "<Plug>TranslateV", opts)
keymap("n", "tw", "<Plug>TranslateW", opts)
keymap("v", "<leader>tw", "<Plug>TranslateWV", opts)
keymap("n", "tr", "<Plug>TranslateR", opts)

keymap("n", "tx", "<Plug>TranslateX", opts)
-- 自定义
keymap("n", "te", "<Plug>Translate :call TranslatorSpeak(v:false)<CR>", opts)
keymap("v", "<leader>te", "<Plug>TranslateV :call TranslatorSpeak(v:true)<CR>", opts)
keymap("n", "ts", ":call TranslatorSpeak(v:false)<CR>", opts)
keymap("v", "<leader>ts", ":call TranslatorSpeak(v:true)<CR>", opts)

-- TODO: wildfire
keymap({ "n", "v" }, "<leader><leader>", "<Plug>(wildfire-fuel)", opts)

-- TODO: hop
keymap(
	"",
	"fs",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>",
	{}
)
keymap(
	"",
	"Fs",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>",
	{}
)
keymap(
	"",
	"fS",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false})<cr>",
	{}
)
keymap(
	"",
	"FS",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false})<cr>",
	{}
)

-- TODO: outline
keymap({ "n", "v" }, "go", "<cmd>SymbolsOutline<CR>", opts)
