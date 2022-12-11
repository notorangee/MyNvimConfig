vim.g.mapleader = ' '
local keymap = vim.keymap.set
local opts = {noremap = true, silent = true}
-- 更新vimrc配置
keymap('n', 'rv', ':w<CR>:source %<CR>', opts)
-- 新建当前标签
keymap('n', 'tn', ':tabnew%<CR>', opts)
-- 关闭当前标签
keymap('n', 'tc', ':tabclose<CR>', opts)
-- 关闭其他标签
keymap('n', 'to', ':tabonly<CR>', opts)
-- 标签切换
keymap('n', 'tk', ':tabprevious<CR>', opts)
keymap('n', 'tj', ':tabnext<CR>', opts)
-- 缓冲区切换
keymap('n', 'bk', ':bp<CR>', opts)
keymap('n', 'bj', ':bn<CR>', opts)
-- 删除缓冲区
keymap('n', 'bc', ':bd<CR>', opts)
-- 列出所有缓冲区
keymap('n', 'bl', ':ls<CR>', opts)
-- 分屏映射
keymap('n', 'wh', ':set nosplitright<CR>:vsplit<CR>', opts)
keymap('n', 'wj', ':set splitbelow<CR>:split<CR>', opts)
keymap('n', 'wk', ':set nosplitbelow<CR>:split<CR>', opts)
keymap('n', 'wl', ':set splitright<CR>:vsplit<CR>', opts)
keymap('n', '<leader>h', '<C-w>h', opts)
keymap('n', '<leader>j', '<C-w>j', opts)
keymap('n', '<leader>k', '<C-w>k', opts)
keymap('n', '<leader>l', '<C-w>l', opts)
-- 修改内置终端按键映射
vim.cmd([[
  tnoremap <S-q> <C-\><C-N>
  "tnoremap <leader>h <C-\><C-N><C-W>h
  "tnoremap <leader>j <C-\><C-N><C-W>j
  "tnoremap <leader>k <C-\><C-N><C-W>k
  "tnoremap <leader>l <C-\><C-N><C-W>l
]])
-- 跳转到弹出的窗口
keymap('n','gw', '<c-w><c-w>', opts)
keymap('v','<leader>gw', '<c-w><c-w>', opts)
-- 其它操作映射
keymap('n', 'yi', 'y0', opts)
keymap("n", "ya", "y$", opts)
keymap('v', '<leader>A', '$', opts)
keymap("v", "<leader>I", "0", opts)
keymap("v", "<leader>i", "I", opts)
keymap("v", "<leader>a", "A", opts)
keymap("v", "<leader>w", "wh", opts)
keymap('v', '<leader>y', '"+yy<Esc>', opts)
keymap('n', 'H', '5h', opts)
keymap('n', 'J', '5j', opts)
keymap('n', 'K', '5k', opts)
keymap('n', 'L', '5l', opts)
keymap('n', 'q', ':q<CR><Esc>', opts)
keymap('n', 'wq', ':wq<CR><Esc>', opts)
keymap('n', '<leader>q', 'q', opts)
keymap('n', '<Esc>', '<Esc>:nohlsearch<CR>:echo<CR>:NvimTreeCollapse<CR>', opts)
keymap('n', '=', 'nzz', opts)
keymap('n', '-', 'nzz', opts)
keymap('n', 'rr', ':w<CR>', opts)
-- 自定义函数映射
keymap('n', '<F3>', ':call Run()<CR>', opts)
keymap('n', '<F4>', ':call RunStop()<CR>:nohlsearch<CR>', opts)
keymap('n', 'mc', ':call OpenMinicom()<CR>', opts)
keymap('n', 'cu', ':call OpenCutecom()<CR>', opts)
