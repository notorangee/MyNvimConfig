-- 加载packer
local status, _ = pcall(require, "init-packer")
if not status then
	vim.notify("初始化packer失败")
end
-- vim配置
require("vim.conf")
require("vim.mapper")
require("vim.markdown")
-- 第三方插件
-- LSP配置
require("lsp.cmp")
require("lsp.lspsaga")
require("lsp.mason")
require("lsp.null_ls")

-- 主题拓展
require("module.gruvbox")
require("module.lualine")
require("module.treesitter")

-- 其它拓展
require("module.undotree")
require("module.nvimtree")
require("module.markdown")
require("module.todocomments")
require("module.trouble")
require("module.translator")
require("module.telescope")
require("module.autopairs")
require("module.formatter")
require("module.alpha")
require("module.outline")
require("module.luasnip")
require("module.other")
-- 按键映射
require("module.mapper")
