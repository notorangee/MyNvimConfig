local keymap = vim.keymap.set
local opts = {noremap = true, silent = true}
-- 更新单前文件配置
keymap('n', '<leader>rv', ':w<CR>:source %<CR>', opts)
-- 保存文件
keymap('n', '<leader>rr', ':w<CR>', opts)
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
keymap('n', '<leader>wh', ':set nosplitright<CR>:vsplit<CR>', opts)
keymap('n', '<leader>wj', ':set splitbelow<CR>:split<CR>', opts)
keymap('n', '<leader>wk', ':set nosplitbelow<CR>:split<CR>', opts)
keymap('n', '<leader>wl', ':set splitright<CR>:vsplit<CR>', opts)
keymap('n', '<leader>h', '<C-w>h', opts)
keymap('n', '<leader>j', '<C-w>j', opts)
keymap('n', '<leader>k', '<C-w>k', opts)
keymap('n', '<leader>l', '<C-w>l', opts)
keymap( 'n', "<C-Right>", ':vertical resize -2<CR>', opts)
keymap( 'n', "<C-Left>", ':vertical resize +2<CR>', opts)
keymap( 'n', "<C-Up>", ':resize +2<CR>', opts)
keymap( 'n', "<C-Down>", ':resize -2<CR>', opts)
-- 修改内置终端按键映射
vim.cmd([[
  tnoremap <S-q> <C-\><C-N>
  "tnoremap <leader>h <C-\><C-N><C-W>h
  "tnoremap <leader>j <C-\><C-N><C-W>j
  "tnoremap <leader>k <C-\><C-N><C-W>k
  "tnoremap <leader>l <C-\><C-N><C-W>l
]])
-- 跳转到弹出的窗口
keymap({'n', 'v'}, '<leader>gw', '<c-w><c-w>', opts)
-- 其它操作映射
keymap('v', '<leader>y', '"+yy<Esc>', opts)
keymap('n', 'H', '5h', opts)
keymap('n', 'J', '5j', opts)
keymap('n', 'K', '5k', opts)
keymap('n', 'L', '5l', opts)
keymap('n', '<leader>q', ':q<CR><Esc>', opts)
keymap('n', '<leader>wq', ':wq<CR>', opts)
keymap('n', '<Esc>', '<Esc>:nohlsearch<CR>:echo<CR>', opts)
keymap('n', '=', 'Nzz', opts)
keymap('n', '-', 'nzz', opts)
-- 自定义函数映射
keymap('n', '<F3>', ':call Run()<CR>', opts)
keymap('n', '<F4>', ':call RunStop()<CR>:nohlsearch<CR>', opts)
keymap('n', '<leader>mc', ':call OpenMinicom()<CR>', opts)
keymap('n', '<leader>cu', ':call OpenCutecom()<CR>', opts)
