Vim�UnDo� � 2B��v}NV!	ϗ�YY�}���/=��H   /   R                args = { '-jar ~/Soft/Java_format/google-java-format.jar', file },   "         8       8   8   8    c'��    _�                             ����                                                                                                                                                                                                                                                                                                                                                             c&��     �                   �               5��                    1                      �      5�_�                            ����                                                                                                                                                                                                                                                                                                                                                       c&��     �         2        logging = true,5��                        �                     5�_�                           ����                                                                                                                                                                                                                                                                                                                                                       c&�     �         2    5��                          P                      5�_�                            ����                                                                                                                                                                                                                                                                                                                                                       c&�      �         3    �         3    5��                          Q               t      5�_�      
                     ����                                                                                                                                                                                                                                                                                                                                                  V        c&�6     �             	            java = {                function()                    return {   "                     exe = 'java',   y                     args = { '-jar', home .. '/Soft/Java_format/google-java-format.jar', vim.api.nvim_buf_get_name(0) },   !                     stdin = true                    }                end   
         }5��           	               �       2              5�_�         	       
   0       ����                                                                                                                                                                                                                                                                                                                                                  V        c&�I     �   0   2   :    5��    0                                           �    0                                          �    0                                           5�_�   
                 1        ����                                                                                                                                                                                                                                                                                                                                                  V        c&�J     �   1   ;   ;    �   1   2   ;    5��    1               	                     2      5�_�                    1        ����                                                                                                                                                                                                                                                                                                                                                  V        c&�L     �   0   1           5��    0                                           5�_�                    9   
    ����                                                                                                                                                                                                                                                                                                                                                  V        c&�P     �   8   :   C      
         }5��    8   
                  <                     5�_�                    1       ����                                                                                                                                                                                                                                                                                                                            1          9                 c&�X     �   0   :   C   	            java = {                function()                    return {   "                     exe = 'java',   y                     args = { '-jar', home .. '/Soft/Java_format/google-java-format.jar', vim.api.nvim_buf_get_name(0) },   !                     stdin = true                    }                end            },5��    0                                          �    1                                          �    2                     /                     �    3                     D                     �    4                     b                     �    5                     �                     �    6                     �                     �    7                                          �    8                                          5�_�                           ����                                                                                                                                                                                                                                                                                                                                      "          v       c&�c     �         C      D        if util.get_current_buffer_file_name() == "special.lua" then             return nil           end       M        -- Full specification of configurations is down below and in Vim help5��                              h               5�_�                           ����                                                                                                                                                                                                                                                                                                                                                v       c&�d     �                *        -- Supports conditional formatting5��                          �      +               5�_�                    5        ����                                                                                                                                                                                                                                                                                                                                                v       c&��     �   4   5           5��    4                      ~                     5�_�                    0   !    ����                                                                                                                                                                                                                                                                                                                            0   !       0   (          (    c&��     �   /   1   =      t                args = { '-jar', home .. '/Soft/Java_format/google-java-format.jar', vim.api.nvim_buf_get_name(0) },5��    /   !                  �                     5�_�                    0   "    ����                                                                                                                                                                                                                                                                                                                            0   !       0   (          (    c&��     �   /   1   =      l                args = { '-jar', '/Soft/Java_format/google-java-format.jar', vim.api.nvim_buf_get_name(0) },5��    /   "                  �                     5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        c&��     �                	-- format   require'formatter'.setup{        filetype = {        }    }        5��                          Q       B               5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        c&��     �                 5��                          O                      5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        c&��     �                 5��                          O                      5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        c&��     �         4    5��                          O                      5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        c&��    �                 5��                          O                      5�_�                            ����                                                                                                                                                                                                                                                                                                                                      "          V       c&��    �                    lua = {   I      -- "formatter.filetypes.lua" defines default configurations for the         -- "lua" filetype   0      require("formatter.filetypes.lua").stylua,       3      -- You can also define your own configuration         function()   L       -- Full specification of configurations is down below and in Vim help           -- files           return {             exe = "stylua",             args = {   *            "--search-parent-directories",               "--stdin-filepath",   B            util.escape_path(util.get_current_buffer_file_path()),               "--",               "-",             },             stdin = true,   	        }   	      end       },5��                          �      r              5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V       c&��     �   
             :    -- Formatter configurations for filetype "lua" go here5��    
                      b      ;               5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V       c&��    �   
             $    -- and will be executed in order5��    
                      b      %               5�_�                           ����                                                                                                                                                                                                                                                                                                                                                         c'��     �               x                args = { '-jar', '/home/orange/Soft/Java_format/google-java-format.jar', vim.api.nvim_buf_get_name(0) },5��                         �                     5�_�                           ����                                                                                                                                                                                                                                                                                                                                                       c'��     �               u                args = { '-jar'/home/orange/Soft/Java_format/google-java-format.jar', vim.api.nvim_buf_get_name(0) },5��                         �                     5�_�                           ����                                                                                                                                                                                                                                                                                                                                                       c'��     �               t                args = { '-jar/home/orange/Soft/Java_format/google-java-format.jar', vim.api.nvim_buf_get_name(0) },5��                         �                     5�_�                            ����                                                                                                                                                                                                                                                                                                                                                       c'��     �               v                args = { '-jar ~/home/orange/Soft/Java_format/google-java-format.jar', vim.api.nvim_buf_get_name(0) },5��                         �                     5�_�      !                      ����                                                                                                                                                                                                                                                                                                                                         *          *    c'��     �               u                args = { '-jar /home/orange/Soft/Java_format/google-java-format.jar', vim.api.nvim_buf_get_name(0) },5��                        �                    5�_�       "           !      K    ����                                                                                                                                                                                                                                                                                                                               K          f          f    c'��     �               j                args = { '-jar ~/Soft/Java_format/google-java-format.jar', vim.api.nvim_buf_get_name(0) },5��       K                                        5�_�   !   #           "          ����                                                                                                                                                                                                                                                                                                                               K          f          f    c'��     �                �             �             5��                          O                      �                          O                      5�_�   "   $           #          ����                                                                                                                                                                                                                                                                                                                               K          f          f    c'��     �               local file =    M-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands�             5��                         \                      5�_�   #   %           $          ����                                                                                                                                                                                                                                                                                                                               K          f          f    c'��     �               )local file = vim.api.nvim_buf_get_name(0)5��                         \                      5�_�   $   &           %      <    ����                                                                                                                                                                                                                                                                                                                               K          f          f    c'��     �               <local file = vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)5��       <                  �                      5�_�   %   '           &      J    ����                                                                                                                                                                                                                                                                                                                               K          f          f    c'��     �               N                args = { '-jar ~/Soft/Java_format/google-java-format.jar',  },5��       J                  =                     5�_�   &   (           '      O    ����                                                                                                                                                                                                                                                                                                                               O          O          O    c'��     �               S                args = { '-jar ~/Soft/Java_format/google-java-format.jar', file  },5��       O                  B                     5�_�   '   )           (           ����                                                                                                                                                                                                                                                                                                                                                V       c'�     �             �             5��                   	       �              �       5�_�   (   *           )          ����                                                                                                                                                                                                                                                                                                                                                V       c'�     �         &    �         &    5��                   	       �              �       5�_�   )   +           *          ����                                                                                                                                                                                                                                                                                                                                                V       c'�#     �         /          java = {5��                        �                    5�_�   *   ,           +          ����                                                                                                                                                                                                                                                                                                                                                V       c'�,     �         /                      exe = 'java',5��                        �                    5�_�   +   -           ,          ����                                                                                                                                                                                                                                                                                                                                         G       v   G    c'�9     �         /      R                args = { '-jar ~/Soft/Java_format/google-java-format.jar', file },5��              .          �      .              5�_�   ,   .           -      *    ����                                                                                                                                                                                                                                                                                                                                         G       v   G    c'�K     �         /      2                args = { '--indent-count', file },5��       *                                       5�_�   -   /           .      .    ����                                                                                                                                                                                                                                                                                                                                         G       v   G    c'�W     �         /      5                args = { '--indent-count', 2, file },5��       .                                       5�_�   .   0           /      .    ����                                                                                                                                                                                                                                                                                                                                         G       v   G    c'�[     �         /      1                args = { '--indent-count', 2,  },5��       .                                       5�_�   /   1           0      /    ����                                                                                                                                                                                                                                                                                                                                         G       v   G    c'�]     �         /      3                args = { '--indent-count', 2, "" },5��       .                                       5�_�   0   2           1      .    ����                                                                                                                                                                                                                                                                                                                                         G       v   G    c'�]     �         /      1                args = { '--indent-count', 2,  },5��       .                                       5�_�   1   3           2      /    ����                                                                                                                                                                                                                                                                                                                                         G       v   G    c'�_     �         /      3                args = { '--indent-count', 2, '' },5��       /                                       5�_�   2   4           3          ����                                                                                                                                                                                                                                                                                                                                         G       v   G    c'�z     �         /          java = {5��                     
   U             
       5�_�   3   5           4   !       ����                                                                                                                                                                                                                                                                                                                                         G       v   G    c'��     �       "   /                      exe = 'java',5��                         �                    5�_�   4   6           5   "       ����                                                                                                                                                                                                                                                                                                                            "          "   G       v   G    c'��     �   !   #   /      R                args = { '-jar ~/Soft/Java_format/google-java-format.jar', file },5��    !          .          �      .              5�_�   5   7           6   "   1    ����                                                                                                                                                                                                                                                                                                                            "          "   G       v   G    c'��     �   !   #   /      4                args = { '--stdin-filepath', file },5��    !   1                  �                     5�_�   6   8           7   "   3    ����                                                                                                                                                                                                                                                                                                                            "          "   G       v   G    c'��     �   !   #   /      6                args = { '--stdin-filepath', file,  },5��    !   3                  �                     5�_�   7               8   "   4    ����                                                                                                                                                                                                                                                                                                                            "          "   G       v   G    c'��    �   !   #   /      8                args = { '--stdin-filepath', file, '' },5��    !   4                  �                     5�_�              
   	   0       ����                                                                                                                                                                                                                                                                                                                                                  V        c&�B     �   0   1   :          �   0   2   ;              �   2   3   <    �   1   3   <   2   ,    -- Utilities for creating configurations   %local util = require "formatter.util"       M-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands   require("formatter").setup {     -- Enable or disable logging     logging = true,     -- Set the log level   "  log_level = vim.log.levels.WARN,   ,  -- All formatter configurations are opt-in     filetype = {   :    -- Formatter configurations for filetype "lua" go here   $    -- and will be executed in order       lua = {   I      -- "formatter.filetypes.lua" defines default configurations for the         -- "lua" filetype   0      require("formatter.filetypes.lua").stylua,       3      -- You can also define your own configuration         function()   *        -- Supports conditional formatting   D        if util.get_current_buffer_file_name() == "special.lua" then             return nil           end       M        -- Full specification of configurations is down below and in Vim help           -- files           return {             exe = "stylua",             args = {   *            "--search-parent-directories",               "--stdin-filepath",   B            util.escape_path(util.get_current_buffer_file_path()),               "--",               "-",             },             stdin = true,   	        }   	      end       },       L    -- Use the special "*" filetype for defining formatter configurations on       -- any filetype       ["*"] = {   I      -- "formatter.filetypes.any" defines default configurations for any         -- filetype   C      require("formatter.filetypes.any").remove_trailing_whitespace       }     }   }5��    0                                           �    0                                           �    0                                          �    1              1                    �      5�_�                            ����                                                                                                                                                                                                                                                                                                                                                V       c&�.     �              5��                          u       K              5�_�                           ����                                                                                                                                                                                                                                                                                                                            7          7                 c&�     �         2       �         3    �         3   2   (-- Utilities for creating configurations   %local util = require "formatter.util"       M-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands   require("formatter").setup {     -- Enable or disable logging     logging = true,     -- Set the log level   "  log_level = vim.log.levels.WARN,   ,  -- All formatter configurations are opt-in     filetype = {   :    -- Formatter configurations for filetype "lua" go here   $    -- and will be executed in order       lua = {   I      -- "formatter.filetypes.lua" defines default configurations for the         -- "lua" filetype   0      require("formatter.filetypes.lua").stylua,       3      -- You can also define your own configuration         function()   *        -- Supports conditional formatting   D        if util.get_current_buffer_file_name() == "special.lua" then             return nil           end       M        -- Full specification of configurations is down below and in Vim help           -- files           return {             exe = "stylua",             args = {   *            "--search-parent-directories",               "--stdin-filepath",   B            util.escape_path(util.get_current_buffer_file_path()),               "--",               "-",             },             stdin = true,   	        }   	      end       },       L    -- Use the special "*" filetype for defining formatter configurations on       -- any filetype       ["*"] = {   I      -- "formatter.filetypes.any" defines default configurations for any         -- filetype   C      require("formatter.filetypes.any").remove_trailing_whitespace       }     }   }5��                          P                      �                   1      P               �      5�_�                    	       ����                                                                                                                                                                                                                                                                                                                                                       c&��     �      
   2      !  log_level = vim.log.levels.any,5��                        !                    �                     	   !             	       �              	          !      	              �                        !                    �                        !                    �                        !                    �                     	   !             	       �              	          !      	              �                        !                    �                        !                    �                     
   !             
       �              
          !      
              �                        !                    �                        !                    �                        !                    �                        !                    �                        !                    �                        !                    �                        !                    �                        !                    �                     	   !             	       �              	          !      	              �                        !                    �                        !                    �                        !                    �                        !                    �                        !                    �                     	   !             	       �              	          !      	              �                        !                    �                        !                    �                        !                    �                        !                    �                     	   !             	       �              	          !      	              �                        !                    �                        !                    �                        !                    �                        !                    �                        !                    �                        !                    �                        !                    �                        !                    �                        !                    �                        !                    �                     
   !             
       �              
          !      
              �                        !                    �                        !                    �                        !                    �                        !                    �                        !                    �                        !                    �                        !                    �                        !                    �                        !                    �                        !                    �                        !                    �                        !                    �                        !                    �                        !                    �                        !                    �                        !                    �                        !                    �                        !                    5��