local jdtls_exec = vim.fn.stdpath('data') .. '/mason/bin/jdtls'
local java_dap_dir = vim.fn.stdpath('data') .. '/mason/share' .. '/java-debug-adapter'

local config = {
  cmd = { jdtls_exec },

  init_options = {
    bundles = { java_dap_dir .. "/com.microsoft.java.debug.plugin.jar" }
  },
}
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
require('jdtls').start_or_attach(config)
