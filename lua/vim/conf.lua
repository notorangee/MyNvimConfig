-- 显示行号
vim.o.number = true
-- 显示当前行，以及其他相对行
vim.o.relativenumber = true
-- 光标所在的行高亮
vim.o.cursorline = true
-- 自折行
vim.o.wrap = false
-- 设置不在单词处折行
vim.o.linebreak = true
-- 搜索时，高亮显示匹配结果
vim.o.hlsearch = true
-- 输入搜索模式时，每输入一个字符，实时高亮并自动跳转到地一个匹配结果
vim.o.incsearch = true
-- 搜索忽略大小写
vim.o.ignorecase = true
-- 智能搜索
vim.o.smartcase = true
-- 永远显示状态栏
vim.o.laststatus = 2
-- 开启补全
vim.o.wildmenu = true
-- 保存撤销历史
vim.o.undofile = true
-- 设置备份文件、交换文件、操作历史文件的保存位置
vim.o.backupdir = '~/.config/nvim/backup/.backup//'
-- im.o.directory = '~/.config/nvim/backup/.swap//'
vim.o.undodir = '~/.config/nvim/backup/.undo//'
-- 自动切换工作目录
vim.o.autochdir = true
-- 出错时，不要发出响声
vim.o.errorbells = false
-- vim记录历史操作的次数
vim.o.history = 1000
-- 打开文件监视，如果被外部更改，发出提示
vim.o.autoread = true
-- 使移动上下屏幕始终显示5行
vim.o.scrolloff = 5
-- 设置缩进4个空格
vim.o.tabstop = 2
vim.o.shiftwidth = 2
-- 制表变空格
vim.o.expandtab = true
-- 自动对齐
vim.o.smartindent = true
-- 开启主题颜色
vim.o.termguicolors = true

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = true
})

-- vimscript配置
vim.cmd([[

"防止新行自动加注释
autocmd FileType * setlocal formatoptions-=c formatoptions-=o formatoptions-=r
"记住上次打开文件的位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"编译运行代码文件
let g:execResult = v:false
func! Run()
  if &filetype == 'java' || &filetype == 'c' || &filetype == 'cpp'
    call RmRunCodeFile()
  else
    exec 'w %'
  endif
  if &filetype == 'java'
    silent exec '!javac %'
    :term java %<
  elseif &filetype == 'c' || &filetype == 'cpp'
    silent exec "!g++ % -o %<\.out"
    :term ./%<\.out
  elseif &filetype == 'sh'
    silent exec '!chmod +x %'
    :term ./%
  elseif &filetype == 'markdown'
    exec 'MarkdownPreview'
  elseif ( &filetype == 'html' || &filetype == 'xml' )
    if !g:execResult
      silent exec '!chromium --new-window % &'
      let g:execResult = v:true
    else
      silent exec '!chromium %'
    endif
  endif
endfunc

"删除编译产生的二进制文件或其它操作
func! RmRunCodeFile()
  exec 'w %'
  if &filetype == 'java'
    silent exec '!rm *.class'
    silent exec '!rm $(find com -name "*.class")'
  elseif &filetype == 'c'
    silent exec '!rm *.out'
  elseif &filetype == 'cpp'
    silent exec '!rm *.out'
  elseif &filetype == 'markdown'
    silent exec 'MarkdownPreviewStop'
  elseif &filetype == 'html' || &filetype == 'xml'
    let g:execResult = v:false
    silent exec '!killall chromium'
  endif
endfunc

"输入法配置
"let g:input_toggle = 0
function! Fcitx2en()
  let s:input_status = system("fcitx-remote")
  if s:input_status == 2
    "let g:input_toggle = 1
    let l:a = system("fcitx-remote -c")
  endif
endfunction

"function! Fcitx2zh()
"  let s:input_status = system("fcitx-remote")
"  if s:input_status != 2 && g:input_toggle == 1
"    let l:a = system("fcitx-remote -o")
"    let g:input_toggle = 0
"  endif
"endfunction

autocmd InsertLeave * call Fcitx2en()
"autocmd InsertEnter * call Fcitx2zh()

]])