-- NOTE: 加载packer
local status, _ = pcall(require, "init-packer")
if not status then
	vim.notify("初始化packer失败")
end
-- NOTE: vim配置
require("vim.conf")
require("vim.markdown")

-- NOTE: LSP配置
require("lsp.cmp")
require("lsp.lspsaga")
require("lsp.mason")
require("lsp.null_ls")

-- NOTE: 主题拓展
require("module.gruvbox")
require("module.lualine")
require("module.treesitter")

-- NOTE: 其它拓展
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

-- NOTE: 按键映射
require("vim.mapper")
require("module.mapper")
