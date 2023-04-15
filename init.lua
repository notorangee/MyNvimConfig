-- NOTE: 加载lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://hub.yzuu.cf/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' ' -- 在初始化lazy前映射leader

local status, lazy_init = pcall(require, "init-lazy")
local lazy_opts = require("init_lazy_opts")
if not status then
	vim.notify("初始化lazy失败")
end

require("lazy").setup(lazy_init, lazy_opts)

-- NOTE: vim配置
require("vim.conf")
require("vim.markdown")

-- NOTE: 按键映射
require("vim.mapper")
