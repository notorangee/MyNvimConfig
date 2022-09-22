-- MarkDown vimscript配置
vim.cmd([[

"autocmd Filetype markdown map <leader>w yiWi[<esc>Ea](<esc>pa)
autocmd Filetype markdown inoremap ,f <Esc>/<++><CR>:nohlsearch<CR>c4l
autocmd Filetype markdown inoremap ,n ---<Enter><Enter>
autocmd Filetype markdown inoremap ,l --------<Enter>
autocmd Filetype markdown inoremap ,i ** <++><Esc>F*i
autocmd Filetype markdown inoremap ,b **** <++><Esc>F*hi
autocmd Filetype markdown inoremap ,s ~~~~ <++><Esc>F~hi
autocmd Filetype markdown inoremap ,d `` <++><Esc>F`i
autocmd Filetype markdown inoremap ,c ```<Enter><++><Enter>```<Enter><++><Esc>3kA
autocmd Filetype markdown inoremap ,p ![](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap ,a [](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap ,1 #<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,2 ##<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,3 ###<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,4 ####<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,5 #####<Space><Enter><++><Esc>kA

nnoremap <silent> ,n :call ReviseMarkdown(0, v:false, 0)<CR>
vnoremap <silent> ,n :call ReviseMarkdown(0, v:true, 0)<CR>
nnoremap <silent> ,l :call ReviseMarkdown(1, v:false, 0)<CR>
vnoremap <silent> ,l :call ReviseMarkdown(1, v:true, 0)<CR>
nnoremap <silent> ,i :call ReviseMarkdown(2, v:false, 0)<CR>
vnoremap <silent> ,i :call ReviseMarkdown(2, v:true, 0)<CR>
nnoremap <silent> ,b :call ReviseMarkdown(3, v:false, 0)<CR>
vnoremap <silent> ,b :call ReviseMarkdown(3, v:true, 0)<CR>
nnoremap <silent> ,s :call ReviseMarkdown(4, v:false, 0)<CR>
vnoremap <silent> ,s :call ReviseMarkdown(4, v:true, 0)<CR>
nnoremap <silent> ,d :call ReviseMarkdown(5, v:false, 0)<CR>
vnoremap <silent> ,d :call ReviseMarkdown(5, v:true, 0)<CR>
nnoremap <silent> ,c :call ReviseMarkdown(6, v:false, 0)<CR>
vnoremap <silent> ,c :call ReviseMarkdown(6, v:true, 0)<CR>
nnoremap <silent> ,1 :call ReviseMarkdown(7, v:false, 1)<CR>
vnoremap <silent> ,1 :call ReviseMarkdown(7, v:true, 1)<CR>
nnoremap <silent> ,2 :call ReviseMarkdown(7, v:false, 2)<CR>
vnoremap <silent> ,2 :call ReviseMarkdown(7, v:true, 2)<CR>
nnoremap <silent> ,3 :call ReviseMarkdown(7, v:false, 3)<CR>
vnoremap <silent> ,3 :call ReviseMarkdown(7, v:true, 3)<CR>
nnoremap <silent> ,4 :call ReviseMarkdown(7, v:false, 4)<CR>
vnoremap <silent> ,4 :call ReviseMarkdown(7, v:true, 4)<CR>
nnoremap <silent> ,5 :call ReviseMarkdown(7, v:false, 5)<CR>
vnoremap <silent> ,5 :call ReviseMarkdown(7, v:true, 5)<CR>
function ReviseMarkdown( selectModeType, selectVisualMode, selectTitle )
  if &filetype == 'markdown'
    let s:currentLine = getline(".") 
    let s:markdownContent = a:selectVisualMode ?  SelectContent() : expand("<cword>")
    let s:insertType = ""
    if a:selectModeType == 0
      let s:failed = append(".", "---")
    elseif a:selectModeType == 1
      let s:failed = append(line("."), "--------")
    elseif a:selectModeType == 2
      let s:insertType = "*"
    elseif a:selectModeType == 3
      let s:insertType = "**"
    elseif a:selectModeType == 4
      let s:insertType = "~~"
    elseif a:selectModeType == 5
      let s:insertType = "`"
    elseif a:selectModeType == 6
      let s:insertType = "~~~"
    elseif a:selectModeType == 7
	if a:selectTitle == 1
	  let s:insertType = "#"
    	elseif a:selectTitle == 2
	  let s:insertType = "##"
    	elseif a:selectTitle == 3
	  let s:insertType = "###"
    	elseif a:selectTitle == 4
	  let s:insertType = "####"
    	elseif a:selectTitle == 5
	  let s:insertType = "#####"
    	endif
    endif
    if !( a:selectModeType == 0 || a:selectModeType == 1 )
      if a:selectModeType == 7
	call SetMarkdownContent(v:true)
	return
      endif
      let s:execStatus = a:selectModeType != 6 ? SetMarkdownContent(v:false) : CodeBlockType(a:selectVisualMode)
      return
    endif
endif
endfunction

function SetMarkdownContent(isInsertTitle)
  let s:markdownContent = a:isInsertTitle ? s:currentLine : s:markdownContent
  let s:replaceContent = a:isInsertTitle ? s:insertType." ".s:currentLine : s:insertType.s:markdownContent.s:insertType
  call setline(".", substitute(s:currentLine, s:markdownContent, s:replaceContent, ""))
  return 0
endfunction

function CodeBlockType(selectVisualMode)
  let s:langType = input("输入语言类型(默认java):\n", "")
  let s:langType = s:langType == "" ? "java" : s:langType
  let s:markdownContent = a:selectVisualMode ? s:markdownContent : s:currentLine
  let s:replaceContent = "\t".s:markdownContent
  call append(line(".") - 1, "~~~".s:langType)
  call setline(".", substitute(s:currentLine, s:markdownContent, s:replaceContent, ""))
  call append(line("."), "~~~")
  "let reverse = (line('.') > line('v')) ? 0 : ( line('.') < line('v') ) ? 1 : ( col('.') < col('v') ) ? 1 : 0
  return 1
endfunction

]])
