vim.opt.completeopt = { "menu", "menuone", "noselect" }
-- Set up nvim-cmp.
local cmp = require("cmp")
local luasnip = require("luasnip")
-- Set up lspconfig.
local lsp = require("lspconfig")
local cmp_lsp = require("cmp_nvim_lsp")
-- local capabilities = cmp_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())
local capabilities = cmp_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- capabilities.textDocument.completion.completionItem.snippetSupport = true
local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = {
	"cmake",
	"jsonls",
	"marksman",
	"pyright",
	"sqlls",
	"lemminx",
	"yamlls",
	"gopls",
}

-- other language server
for _, server in ipairs(servers) do
	lsp[server].setup({
		-- on_attach = my_custom_on_attach,
		capabilities = capabilities,
	})
end

-- clangd
lsp.clangd.setup({
	capabilities = capabilities,
  cmd = {
    "clangd",
    "--enable-config",
    "--pch-storage=memory",
    "--background-index",
  };
  filetypes = {"c", "cpp", "objc", "objcpp", "cuda", "proto"};
  single_file_support = true;
  args = {
    "-ferror-limit=0"
  }
})

-- html
lsp.html.setup({
	capabilities = capabilities,
	cmd = {
		"vscode-html-language-server",
		"--stdio",
	},
	filetype = {
		"html",
	},
	init_options = {
		configurationSection = { "html", "css", "javascript" },
		embeddedLanguages = {
			css = true,
			javascript = true,
		},
		provideFormatter = true,
	},
	single_file_support = true,
})

-- cssls
lsp.cssls.setup({
	capabilities = capabilities,
	cmd = {
		"vscode-css-language-server",
		"--stdio",
	},
	filetype = {
		"css",
		"scss",
		"less",
	},
	settings = {
		css = {
			validate = true,
		},
		less = {
			validate = true,
		},
		scss = {
			validate = true,
		},
	},
	single_file_support = true,
})

-- tsserver/javascript
lsp.tsserver.setup({
	capabilities = capabilities,
	cmd = {
		"typescript-language-server",
		"--stdio",
	},
	filetype = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
	},
	init_options = {
		hostInfo = "neovim",
	},
	single_file_support = true,
})

-- lua
lsp.sumneko_lua.setup({
	capabilities = capabilities,
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
})

-- bashls
lsp.bashls.setup({
	capabilities = capabilities,
	cmd = {
		"bash-language-server",
		"start",
	},
	cmd_env = {
		GLOB_PATTERN = "*@(.sh|.inc|.bash|.command)",
	},
	filetype = {
		"sh",
	},
	single_file_support = true,
})

-- vimls
lsp.vimls.setup({
	cmd = {
		"vim-language-server",
		"--stdio",
	},
	filetype = {
		"vim",
	},
	init_options = {
		diagnostic = {
			enable = true,
		},
		indexes = {
			count = 3,
			gap = 100,
			projectRootPatterns = { "runtime", "nvim", ".git", "autoload", "plugin" },
			runtimepath = true,
		},
		isNeovim = true,
		iskeyword = "@,48-57,_,192-255,-#",
		runtimepath = "",
		suggest = {
			fromRuntimepath = true,
			fromVimruntime = true,
		},
		vimruntime = "",
	},
	single_file_support = true,
})

-- nvim-cmp setup
cmp.setup({
  completion = {
    autocomplete = false,
  },
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-k>"] = cmp.mapping.scroll_docs(-4),
		["<C-j>"] = cmp.mapping.scroll_docs(4),
		["<C-o>"] = cmp.mapping.complete(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "nvim_lsp_signature_help" },
		{ name = "path" },
		--{ name = "fuzzy_path" },
	},
})

-- Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
	sources = cmp.config.sources({
		{ name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
	}, {
		{ name = "buffer" },
	}),
})

---- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
--cmp.setup.cmdline('/', {
--  mapping = cmp.mapping.preset.cmdline(),
--  sources = {
--    { name = 'buffer' }
--  }, {
--    { name = 'fuzzy_buffer' }
--  }, {
--    {name = 'rg'}
--  }
--})
--
---- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
--cmp.setup.cmdline(':', {
--  mapping = cmp.mapping.preset.cmdline(),
--  sources = cmp.config.sources({
--    { name = 'path' }
--  }, {
--    { name = 'cmdline' }
--  }, {
--    { name = 'fuzzy_path' }
--  }, {
--    {name = 'rg'}
--  })
--})

local kind_icons = {
	Text = "",
	Method = "",
	Function = "",
	Constructor = "",
	Field = "",
	Variable = "",
	Class = "ﴯ",
	Interface = "",
	Module = "",
	Property = "ﰠ",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = "",
}

cmp.setup({
	formatting = {
		format = function(entry, vim_item)
			-- Kind icons
			vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
			-- Source
			vim_item.menu = ({
				nvim_lsp = "[LSP]",
				buffer = "[Buffer]",
				luasnip = "[LuaSnip]",
				nvim_lua = "[Lua]",
				latex_symbols = "[LaTeX]",
			})[entry.source.name]
			return vim_item
		end,
	},
})

-- auto-pairs
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

