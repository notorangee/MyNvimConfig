require("mason").setup({
    ui = {
        -- Whether to automatically check for new versions when opening the :Mason window.
        check_outdated_packages_on_open = true,

        -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
        border = "none",

        icons = {
            -- The list icon to use for installed packages.
            package_installed = "✓",
            -- The list icon to use for packages that are installing, or queued for installation.
            package_pending = "➜",
            -- The list icon to use for packages that are not installed.
            package_uninstalled = "✗",
        },

        keymaps = {
            -- Keymap to expand a package
            toggle_package_expand = "<CR>",
            -- Keymap to install the package under the current cursor position
            install_package = "i",
            -- Keymap to reinstall/update the package under the current cursor position
            update_package = "u",
            -- Keymap to check for new version for the package under the current cursor position
            check_package_version = "c",
            -- Keymap to update all installed packages
            update_all_packages = "U",
            -- Keymap to check which installed packages are outdated
            check_outdated_packages = "C",
            -- Keymap to uninstall a package
            uninstall_package = "X",
            -- Keymap to cancel a package installation
            cancel_installation = "<C-c>",
            -- Keymap to apply language filter
            apply_language_filter = "<C-f>",
        },
    },

    -- The directory in which to install packages.
    --install_root_dir = path.concat { vim.fn.stdpath "data", "mason" },

    pip = {
        -- These args will be added to `pip install` calls. Note that setting extra args might impact intended behavior
        -- and is not recommended.
        --
        -- Example: { "--proxy", "https://proxyserver" }
        -- install_args = {"--proxy", "socks5://127.0.0.1:1080"},
    },

    -- Controls to which degree logs are written to the log file. It's useful to set this to vim.log.levels.DEBUG when
    -- debugging issues with package installations.
    log_level = vim.log.levels.INFO,

    -- Limit for the maximum amount of packages to be installed at the same time. Once this limit is reached, any further
    -- packages that are requested to be installed will be put in a queue.
    max_concurrent_installers = 10,

    github = {
        -- The template URL to use when downloading assets from GitHub.
        -- The placeholders are the following (in order):
        -- 1. The repository (e.g. "rust-lang/rust-analyzer")
        -- 2. The release version (e.g. "v0.3.0")
        -- 3. The asset name (e.g. "rust-analyzer-v0.3.0-x86_64-unknown-linux-gnu.tar.gz")
        download_url_template = "https://github.com/%s/releases/download/%s/%s",
    },
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

require("mason-lspconfig").setup({
    ensure_installed = {},
    -- ensure_installed = {"lua_ls", "clangd", "bashls", "cmake", "cssls", "html", "jsonls",
    --   "ts_ls", "marksman", "pyright", "sqlls", "vimls", "lemminx", "yamlls", "gopls" },
    automatic_installation = true,
    handlers = {
      function(server_name)
        -- This is the key change: using vim.lsp.config
        local server_config = {
          name = server_name,
          on_attach = on_attach,
          capabilities = capabilities,
        }

        if server_name == "clangd" then
          server_config = {
            name = server_name,
            on_attach = on_attach,
            capabilities = capabilities,
            cmd = {
              "clangd",
              "--pch-storage=memory",
              "--background-index",
              "--header-insertion=never",
            },
            filetypes = {"c", "cpp", "objc", "objcpp", "cuda", "proto"};
            single_file_support = true,
            settings = {
              CompileFlags = {
                Add = {
                  "-ferror-limit=0",
                },
              },
              InlayHints = {
                Designators = true,
                Enabled = true,
                ParameterNames = true,
                DeducedTypes = true,
              },
            },
          }
        end
        if server_name == "html" then
          server_config = {
            name = server_name,
            on_attach = on_attach,
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
          }
        end
        if server_name == "cssls" then
          server_config = {
            name = server_name,
            on_attach = on_attach,
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
          }
        end
        if server_name == "ts_ls" then
          server_config = {
            name = server_name,
            on_attach = on_attach,
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
          }
        end
        if server_name == "lua_ls" then
          server_config = {
            name = server_name,
            on_attach = on_attach,
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
          }
        end
        if server_name == "bashls" then
          server_config = {
            name = server_name,
            on_attach = on_attach,
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
          }
        end
        if server_name == "vimls" then
          server_config = {
            name = server_name,
            on_attach = on_attach,
            capabilities = capabilities,
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
          }
        end
        -- Enable the server for the current buffer
        vim.lsp.config(server_config)
        vim.lsp.enable(server_name)
      end,
    }
})
