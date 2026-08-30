-- 设置字符集
vim.o.fileencodings="utf-8,ucs-bom,gb18030,gbk,gb2312,cp936"
-- vim.o.termencoding="utf-8"
vim.o.encoding="utf-8"
-- 显示行号
vim.o.number = true
-- 关闭虚拟文字提示
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})
-- 开启lsp诊断图标
local signs = { Error = "", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  -- vim.fn.sign_define()
  -- vim.diagnostic.config(hl, { texthl = hl, text = icon, numhl = hl })
end

-- 显示当前行，以及其他相对行
vim.o.relativenumber = true;
-- 光标所在的行高亮
vim.o.cursorline = true
-- 自动折行
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
--vim.o.backupdir = '~/.config/nvim/backup/.backup//'
--vim.o.directory = '~/.config/nvim/backup/.swap//'
--vim.o.undodir = '~/.config/nvim/backup/.undo//'
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
-- 设置缩进2个空格
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.autoindent = true
vim.o.cindent = true
-- 制表变空格
vim.o.expandtab = true
-- 自动对齐
vim.o.smartindent = true
-- 开启主题颜色
vim.o.termguicolors = true
-- 禁用鼠标
vim.o.mouse = "a"
vim.o.conceallevel = 1

vim.treesitter.language.register('markdown', 'vimwiki')

-- vimscript配置
vim.cmd([[

"防止新行自动加注释
autocmd FileType * setlocal formatoptions-=c formatoptions-=o formatoptions-=r
"记住上次打开文件的位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"编译运行代码文件
let g:execResult = v:false
func! Run()
  if &filetype == 'java'
    call RunStop()
  else
    exec 'w %'
  endif
  if &filetype == 'java'
    silent exec '!javac %'
    :term java %<
  elseif &filetype == 'c'
    let s:getDevice = system('ls /dev/ | grep "ttyACM"')
    let s:Device = ""
    for i in split(s:getDevice)
      let s:Device = i
      break
    endfor
    if s:Device ==# "ttyACM0"
      if !filereadable('compile_commands.json')
       :term bear -- make && make hex install
      else
       :term make && make hex install
      endif
    else
      if filereadable('./makefile')
        if !filereadable('compile_commands.json')
          " :term bear -- make
          :term make
        else
          :term make
        endif
      else
        silent exec "!g++ % -o %<\.out"
        :term ./%<\.out
      endif
    endif
  elseif &filetype == 'sh'
    silent exec '!chmod +x %'
    :term ./%
  elseif &filetype == 'markdown'
    exec 'MarkdownPreviewToggle'
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
func! RunStop()
  exec 'w %'
  if &filetype == 'java'
    silent exec '!rm *.class'
    silent exec '!rm $(find com -name "*.class")'
  elseif &filetype == 'c'
    "silent exec '!rm *.out'
      if filereadable('makefile')
        silent exec '!make clean'
      else
        silent exec '!rm -rf $(find . -name "*.out")'
      endif
  elseif &filetype == 'markdown'
    silent exec 'MarkdownPreviewStop'
  elseif &filetype == 'hrml' || &filetype == 'xml'
    let g:execResult = v:false
    silent exec '!killall chromium'
  endif
endfunc

function OpenMinicom()
  :term sudo minicom
endfunction

function OpenCutecom()
  :term cutecom
endfunction

"输入法配置
"let g:input_toggle = 0
function! Fcitx2en()
  let s:input_status = system("fcitx5-remote")
  if s:input_status == 2
    "let g:input_toggle = 1
    let l:a = system("fcitx5-remote -c")
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

-- lua 配置
-- 格式化函数配置
function format_range_operator()
  local old_func = vim.go.operatorfunc
  _G.op_func_formatting = function()
    local start = vim.api.nvim_buf_get_mark(0, '[')
    local finish = vim.api.nvim_buf_get_mark(0, ']')
    vim.lsp.buf.range_formatting({}, start, finish)
    vim.go.operatorfunc = old_func
    _G.op_func_formatting = nil
  end
  vim.go.operatorfunc = 'v:lua.op_func_formatting'
  vim.api.nvim_feedkeys('g@', 'n', false)
end
    -- local cookie = "S=billing-ui-v3=0pubKfJGlTvqTyt2T0KHWZC5l6Y1b8FN:billing-ui-v3-efe=0pubKfJGlTvqTyt2T0KHWZC5l6Y1b8FN; __Secure-ENID=29.SE=Ts9eE12fFVJEXc4AGU1TMzdi0fg-KjWTuWuRnVgIZZQjbt7wpGA426uQvYH13WrRB30rEwmaUrXFyJYwEOX5eoOb_dIj3URzJAq9Xz_Ik-C3uGWocUUN0K7jHP_swqWAR8v56wFD9GGokyjHvYQeoDjt562ZwHKIrSgp8YFaLjirFzfCY78NUMFH-VJY2x3N-t5h8VCyrK5pWGRpdStz2Y7A8tEtCcfczuTL-BOCL0kq0cjpC4W5tljrKAmtcw2yeyC0T6-W0AC0IQW8Gx0pm7CdSDkvwMZSp9CQH-_Doru7iD3bg1VLgQ; __Secure-BUCKET=CP8B; OTZ=8724130_24_24__24_; SID=g.a000BQnQcrh5emy2dgH6XpCbAyo9stK2vIEuvb8w5hZWtoHQmed_pt1iOnEM2JFZzFJu7bKpeQACgYKAYwSARASFQHGX2MiV-EmHfalo3gZ7ZqzbELoMBoVAUF8yKqjMzziMYXjlSssdv4jZFCC0076; __Secure-1PSID=g.a000BQnQcrh5emy2dgH6XpCbAyo9stK2vIEuvb8w5hZWtoHQmed_qjj5-HhhCeiqSBRP4B2ZagACgYKAVcSARASFQHGX2Miji0gUDSuQFR7Lt8yPBHq4BoVAUF8yKrdrJfEZsDkG0oN89GJJ2tw0076; __Secure-3PSID=g.a000BQnQcrh5emy2dgH6XpCbAyo9stK2vIEuvb8w5hZWtoHQmed_VJHlVPKp3tX_8gNisgkoIwACgYKAZASARASFQHGX2MiCgvyzGjBxjwPigSv8IV8VRoVAUF8yKr-Rai5j1txUGj62kX8O-lQ0076; HSID=A5w8jhHD8DvJ6cvZ7; SSID=A7Pw_aMR2zlkrQy2o; APISID=QpwyTuo1sJDMApAj/A9cvrqEkdpiFcHQAk; SAPISID=QuUkjIjPbjPFr8uj/AYR0iNMp82E_alNcf; __Secure-1PAPISID=QuUkjIjPbjPFr8uj/AYR0iNMp82E_alNcf; __Secure-3PAPISID=QuUkjIjPbjPFr8uj/AYR0iNMp82E_alNcf; AEC=AdJVEauW5n3T-kPD2IiSVyRQMJ_49UaMsjpFq_IVjTj7GglWw2fXSFjcYT0; SEARCH_SAMESITE=CgQI16EB; NID=534=SQv0CXUxqlrZWIAgpWBQ2xC4hlKXuE49FXSUzw5EVhJtEQfqvlWBERled9wf10PzJrJ6E3NZD23-jWH2sp5rRTrDHKA2sUjiURYONhwYDHo86_HIQTMvRw17q3KJuuoj-z5p0iBmeO7DXFge20yFC1dIfGhaAYit3ykjzcenh-0-0QnkLE0euYmCo_IKak8e1xhqqA-FvautaWIpc7t1rnMHb3plIXZWCdpWpxdcT1g555I2AUr8Zc83H6OB3z88UOFCfxIUejABQCBm_K_rQBABDlECd4T-7x_WRW2YXeydvLz7XAHeigkUnjDgZAUxgGEmhWoRBFgXB7A9z-eT8_rP6TjhfYrrGpjhFgaQ5gANaEWOY5VkQKyEr-IG7_h188L-QwE7S8vt1VXrrmZnnIjzTHRWyKwhERGr1jclAJ2gedn8aTqp0WClNixRQcEbw-NpmOWLsS15rcmJSe_tSOYqnI4IgGeWP5TezsH9NhUbSbPJnkeN674JjlmRE2Zx2_fVCQJgGZyr3rPNvxrx9vjLMDxkkxNZ7xjQzpVz4V0yrfGQcVIjAma546qdedEpZvw-T4nar2dpAbz-8NiO4dlVEWGQpI4WDxl8tqccdzVQqsyWSfmbMaG7ZZJ0oy4cZvTKl8wHI0wA73U7R-qYUBbaaJNrBfeL2vqABk9wHiC7bhxysyI9K-M_8KP7OjBu4u42Udz18W2RJ9XRGSh1MvMPY8K2A7zKO4qQHCulh3xM7MQ-oTm-TMy3gaDmnStOA9esIPcQsJ6ZQn3FRzh_AcFIvnXXjT8nc-H__6XqH0JFNYMVkEKL14O39zuJdrlVLdJXSxXBIfvO1ZJ43V-Grt6tkvT9M_vcE13B6LbQk9mvM4OMjv8; __Secure-1PSIDTS=sidts-CjIBXMw41UAfczhwQngbplIB9z0c6eF44PRj2G9nHG-gdOP8m-Am1LJ2RpE4wSr-ARcBHxAA; __Secure-3PSIDTS=sidts-CjIBXMw41UAfczhwQngbplIB9z0c6eF44PRj2G9nHG-gdOP8m-Am1LJ2RpE4wSr-ARcBHxAA; SIDCC=AKEyXzWEmXHpAqIv-eGbqfmnkETZqjmyS-1U2L_1Sy6e-MJ1rJ3wMppCc3oy8EvZSO0zun1LPw; __Secure-1PSIDCC=AKEyXzVjlLo5fPkOFVTN1YapsUP5T74M8vSb76wFAOxxQfqidbEnxGWPf4G21kDwG22HCpraNTY; __Secure-3PSIDCC=AKEyXzWEdUrqb-sDb3489OhFGFEdsTZ0Sw4haoMDZvojaziyqH3FCoFVLjK5R1FN2BxlBQBdcF4"

local function url_encode(str)
    if str then
        str = string.gsub(str, "\n", "\r\n")
        str = string.gsub(str, "([^%w %-%_%.%~])", function(c)
            return string.format("%%%02X", string.byte(c))
        end)
        str = string.gsub(str, " ", "+")
    end
    return str
end

local function get_visual_selection()
    local s_start = vim.fn.getpos("'<")
    local s_end = vim.fn.getpos("'>")
    local n_lines = math.abs(s_end[2] - s_start[2]) + 1
    local lines = vim.api.nvim_buf_get_lines(0, s_start[2] - 1, s_end[2], false)
    
    if n_lines == 0 then return "" end
    
    lines[1] = string.sub(lines[1], s_start[3], -1)
    if n_lines == 1 then
        lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3] - s_start[3] + 1)
    else
        lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3])
    end
    
    return table.concat(lines, ' ')
end

local function show_floating_window(lines)
    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

    local width = 0
    for _, line in ipairs(lines) do
        local line_len = vim.fn.strdisplaywidth(line)
        if line_len > width then width = line_len end
    end

    width = math.min(math.max(width + 2, 30), 100)
    local height = math.min(#lines, 25)

    local opts = {
        relative = 'cursor', row = 1, col = 0,
        width = width, height = height,
        style = 'minimal', border = 'rounded'
    }

    local win = vim.api.nvim_open_win(buf, true, opts)
    vim.bo[buf].modifiable = false
    vim.bo[buf].bufhidden = 'wipe'
    
    vim.keymap.set('n', 'q', '<cmd>close<CR>', { buffer = buf, silent = true, nowait = true })
    vim.keymap.set('n', '<Esc>', '<cmd>close<CR>', { buffer = buf, silent = true, nowait = true })
end

function DirectGoogleTranslate(mode)
    local text = ""
    if mode == "v" or mode == "V" then
        text = get_visual_selection()
    else
        text = vim.api.nvim_get_current_line()
    end

    text = text:gsub("^%s*(.-)%s*$", "%1")
    if text == "" then return end

    -- 使用 echo 在命令行显示，并能随时被覆盖
    vim.api.nvim_echo({{"🚀 正在请求 Google API...", "WarningMsg"}}, false, {})

    local tts_url = string.format("https://translate.googleapis.com/translate_tts?ie=UTF-8&client=tw-ob&tl=en&q=%s", url_encode(text))
    vim.fn.jobstart({ "mpv", "--no-video", "--no-terminal", tts_url })

    local api_url = string.format(
        "https://translate.googleapis.com/translate_a/single?client=gtx&sl=auto&tl=zh-CN&dt=t&dt=bd&dt=ex&q=%s",
        url_encode(text)
    )

    local user_agent = ""
    local cookie = ""

    local curl_cmd = {
      "curl", "-s",
      "-A", user_agent,
      "-b", cookie,
      api_url
    }

    local response_data = {}

    vim.fn.jobstart(curl_cmd, {
        stdout_buffered = true,
        on_stdout = function(_, data)
            if data then
                for _, line in ipairs(data) do
                    table.insert(response_data, line)
                end
            end
        end,
        on_exit = function(_, code)
            -- 清除底部的 “正在请求” 提示
            vim.schedule(function()
                vim.api.nvim_echo({{"", "Normal"}}, false, {})
            end)

            if code == 0 then
                local json_str = table.concat(response_data, "")
                if json_str == "" then return end

                local ok, parsed = pcall(vim.fn.json_decode, json_str)
                if not ok or type(parsed) ~= "table" then
                    return
                end

                local output_lines = {}

                -- 1. 提取主翻译
                if parsed[1] and type(parsed[1]) == "table" then
                    local main_trans = ""
                    for _, segment in ipairs(parsed[1]) do
                        if type(segment) == "table" and segment[1] then 
                            main_trans = main_trans .. segment[1] 
                        end
                    end
                    if main_trans ~= "" then
                        table.insert(output_lines, "  [翻译]")
                        table.insert(output_lines, " • " .. main_trans)
                    end
                end

                -- 2. 安全提取字典详情 (加了严格的类型判断，防止句子报错)
                if parsed[2] and type(parsed[2]) == "table" then
                    table.insert(output_lines, "")
                    table.insert(output_lines, " 󱉟 [更多释义]")
                    for _, dict_item in ipairs(parsed[2]) do
                        if type(dict_item) == "table" then
                            local pos = dict_item[1]
                            local terms = dict_item[2]
                            if pos and terms and type(terms) == "table" then
                                table.insert(output_lines, " • " .. tostring(pos) .. ": " .. table.concat(terms, ", "))
                            end
                        end
                    end
                end

                -- 3. 安全提取例句
                local examples = nil
                for _, v in pairs(parsed) do
                    if type(v) == "table" and type(v[1]) == "table" and type(v[1][1]) == "string" and string.match(v[1][1], "<b>") then
                        examples = v
                        break
                    end
                end

                if examples and type(examples) == "table" then
                    table.insert(output_lines, "")
                    table.insert(output_lines, " 󱚌 [例句]")
                    local count = 0
                    for _, ex_item in ipairs(examples) do
                        if type(ex_item) == "table" and ex_item[1] then
                            local clean_ex = ex_item[1]:gsub("<b>", ""):gsub("</b>", "")
                            table.insert(output_lines, "  " .. tostring(count + 1) .. ". " .. clean_ex)
                            count = count + 1
                            if count >= 3 then break end
                        end
                    end
                end

                vim.schedule(function()
                    if #output_lines > 0 then
                        show_floating_window(output_lines)
                    else
                        vim.notify("未找到翻译结果", vim.log.levels.WARN)
                    end
                end)
            else
                vim.schedule(function()
                    vim.notify("请求 Google API 失败，curl 退出码: " .. tostring(code), vim.log.levels.ERROR)
                end)
            end
        end
    })
end
