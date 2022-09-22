vim.g.translator_target_lang = 'zh'
vim.g.translator_source_lang = 'auto'
vim.g.translator_default_engines = {
  'google', 'youdao', 'bing', 'haici'
}
vim.g.translator_proxy_url = 'socks5://127.0.0.1:1080'
vim.g.translator_history_enable = false
vim.g.translator_window_type = 'preview'

vim.cmd([[

function TranslatorSpeak( isVisual )
  if(!a:isVisual)
    let s:content = expand("<cword>")
  elseif(a:isVisual)
    let s:content = SelectContent()
  endif
  call system("trans :en -sp '".s:content."'" )
endfunction

function SelectContent()
    let [s:lnum1, s:col1] = getpos("'<")[1:2]
    let [s:lnum2, s:col2] = getpos("'>")[1:2]
    let s:lines = getline(s:lnum1, s:lnum2)
    let s:lines[-1] = s:lines[-1][: s:col2 - (&selection == 'inclusive' ? 1 : 2)]
    let s:lines[0] = s:lines[0][s:col1 - 1:]
    return join(s:lines, ' ')
endfunction

]])
