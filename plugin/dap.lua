vim.pack.add {
  'https://github.com/mfussenegger/nvim-dap',
  'https://github.com/nvim-neotest/nvim-nio',
  'https://github.com/theHamsta/nvim-dap-virtual-text',
  'https://github.com/williamboman/mason.nvim',

  'https://github.com/igorlfs/nvim-dap-view',
}

local dap = require 'dap'
require('nvim-dap-virtual-text').setup {}

vim.keymap.set('n', '<leader>;', dap.toggle_breakpoint, { desc = 'DAP: Toggle Breakpoint' })
vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = 'DAP: Toggle Breakpoint' })
vim.keymap.set('n', '<leader>dd', dap.continue, { desc = 'DAP: Continue' })
-- vim.keymap.set('n', '<leader>dq', dap.disconnect, { desc = 'DAP: Stop' })
vim.keymap.set('n', '<leader>dk', dap.step_over, { desc = 'DAP: Step Over' })
vim.keymap.set('n', '<leader>dl', dap.step_into, { desc = 'DAP: Step Into' })
vim.keymap.set('n', '<leader>dj', dap.step_back, { desc = 'DAP: Step Back' })
vim.keymap.set('n', '<leader>dr', dap.restart, { desc = 'DAP: Restart' })

dap.adapters.haskell = {
  type = 'executable',
  command = 'haskell-debug-adapter',
  args = { '--hackage-version=0.0.33.0' },
}
dap.configurations.haskell = {
  {
    type = 'haskell',
    request = 'launch',
    name = 'Debug',
    workspace = '${workspaceFolder}',
    startup = '${file}',
    stopOnEntry = true,
    logFile = vim.fn.stdpath 'data' .. '/haskell-dap.log',
    logLevel = 'WARNING',
    ghciEnv = vim.empty_dict(),
    ghciPrompt = 'λ: ',
    -- Adjust the prompt to the prompt you see when you invoke the stack ghci command below
    ghciInitialPrompt = 'λ: ',
    ghciCmd = 'stack ghci --test --no-load --no-build --main-is TARGET --ghci-options -fprint-evld-with-show',
  },
}
