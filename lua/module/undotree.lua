-- undotree 配置
-- 存储历史修改记录
vim.cmd([[
  " 存储历史修改记录
  if has("persistent_undo")
    let s:target_path = expand('~/.config/nvim/backup/undotree/.undodir')
    if !isdirectory(s:target_path)
      call mkdir(s:target_path, "p", 0700)
    endif
  
    let &undodir=s:target_path
    set undofile
  endif
]])

-- 自动打开差异窗口
vim.g.undotree_DiffAutoOpen = 1
-- 打开撤销树就将光标移动到撤销树上
vim.g.undotree_SetFocusWhenToggle = 1
vim.g.undotree_RelativeTimestamp = 1
-- 突出显示更改的文本
vim.g.undotree_HighlightChangedText = 1
