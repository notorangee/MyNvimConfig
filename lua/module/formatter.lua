-- Utilities for creating configurations
local util = require "formatter.util"
local file = vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))
-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup {
  -- Enable or disable logging
  logging = false,
  -- Set the log level
  log_level = vim.log.levels.WARN,
  -- All formatter configurations are opt-in
  filetype = {
    java = {
        function()
            return {
                exe = 'java',
                args = { '-jar ~/Soft/Java_format/google-java-format.jar', file },
                stdin = true
            }
        end
    },
    lua = {
        function()
            return {
                exe = 'luafmt',
                args = { '--indent-count', 2, '--stdin' },
                stdin = true
            }
        end
    },
    javascript = {
        function()
            return {
                exe = 'prettier',
                args = { '--stdin-filepath', file, '--single-quote' },
                stdin = true
            }
        end
    },
    -- Use the special "*" filetype for defining formatter configurations on
    -- any filetype
    ["*"] = {
      -- "formatter.filetypes.any" defines default configurations for any
      -- filetype
      require("formatter.filetypes.any").remove_trailing_whitespace
    }
  }
}
