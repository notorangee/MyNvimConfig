-- NOTE: 加载lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

local status, _ = pcall(require, "init-lazy")
if not status then
	vim.notify("初始化lazy失败")
end


-- NOTE: vim配置
require("vim.conf")
require("vim.markdown")

-- NOTE: 按键映射
require("vim.mapper")
