local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  vim.notify('null-ls加载错误')
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting

null_ls.setup({
	debug = false,
	sources = {
    -- javascript / css / json / yaml /markdown
		formatting.prettier.with({
      filetypes = { "html", "css", "json", "yaml", "markdown" },
      extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } 
    }),
    -- python
		formatting.black.with({ extra_args = { "--fast" } }),
    -- lua
		formatting.stylua,
    -- java
		formatting.google_java_format,
    -- packer
		formatting.packer,
    -- sql
		formatting.sql_formatter,
    -- asm
		formatting.asmfmt,
    -- c / cpp
		formatting.clang_format,
    -- cmake
		formatting.cmake_format,
    -- golang
		formatting.gofmt,
    formatting.goimports,
    -- xml
		formatting.xmllint,
	},
})
