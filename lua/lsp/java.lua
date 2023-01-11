-- environment
local home = os.getenv('HOME')
local root_dir = require('jdtls.setup').find_root({'.git', 'pom.xml', 'gradlew'})
local project_name = vim.fn.fnamemodify(root_dir, ':p:h:t')
local workspace_dir = home .. '/jdtls-workspace/' .. project_name

local config = {
  cmd = {
    '/usr/lib/jvm/java-11-openjdk/bin/java', -- or '/path/to/java17_or_newer/bin/java'
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xms1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
    '-jar', '/home/orange/Soft/jdtls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
    '-configuration', '/home/orange/Soft/jdtls/config_linux',
    '-data', workspace_dir
  },

  filetypes = { "java" },
  root_dir = root_dir,

  settings = {
    ['java.format.settings.url'] = home .. "/Soft/Java_format/google-format-style.xml",
    ['java.format.settings.profile'] = "GoogleStyle",
    java = {
      home="/usr/lib/jvm/java-11-openjdk",
      eclipse = {
        downloadSources = true,
      },
      server = {
        launchMode = "Hybrid",
      },
      maven = {
        downloadSources = true,
        updateSnapshots = true,
      },
      codeGeneration = {
        toString = {
          template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}"
        },
        hashCodeEquals = {
          useJava7Objects = true,
        },
        useBlocks = true,
      },
      configuration = {
        maven = {

        },
        runtimes = {
          {
            name = "JavaSE-1.8",
            path = "/usr/lib/jvm/java-8-openjdk",
          },
          {
            name = "JavaSE-11",
            path = "/usr/lib/jvm/java-11-openjdk",
          },
        }
      },
    }
  },
  init_options = {
    bundles = {}
  },
}
require('jdtls').start_or_attach(config)
