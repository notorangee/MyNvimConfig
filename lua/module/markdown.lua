-- MarkdownPreview 配置
vim.cmd[[
  function OpenMarkdownPreview (url)
    execute "silent ! chromium --new-window " . a:url .. " &"
  endfunction
]]
vim.g.mkdp_auto_start         = 0
vim.g.mkdp_auto_close         = 0
vim.g.mkdp_refresh_slow       = 0
vim.g.mkdp_command_for_global = 0
vim.g.mkdp_open_to_the_world  = 0
vim.g.mkdp_open_ip            = '127.0.0.1'
vim.g.mkdp_browser            = 'chromium'
vim.g.mkdp_echo_preview_url   = 1
vim.g.mkdp_browserfunc        = 'OpenMarkdownPreview'
vim.g.mkdp_port                = '8848'
vim.g.mkdp_page_title          = '「${name}」'
vim.g.mkdp_filetypes           = { 'markdown' }
