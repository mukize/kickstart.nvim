return {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio",
    "theHamsta/nvim-dap-virtual-text",
    "williamboman/mason.nvim",
  },
  config = function()
    local dap, dapui = require("dap"), require("dapui")
    dapui.setup()
    require("nvim-dap-virtual-text").setup()

    vim.keymap.set({ 'n', 'v' }, '<leader>?', function()
      dapui.eval(nil, { enter = true })
    end, { desc = 'DAP: Toggle Breakpoint' })
    vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = 'DAP: Toggle Breakpoint' })
    vim.keymap.set('n', '<leader>dd', dap.continue, { desc = 'DAP: Continue' })
    -- vim.keymap.set('n', '<leader>dq', dap.disconnect, { desc = 'DAP: Stop' })
    vim.keymap.set('n', '<leader>dk', dap.step_over, { desc = 'DAP: Step Over' })
    vim.keymap.set('n', '<leader>dl', dap.step_into, { desc = 'DAP: Step Into' })
    vim.keymap.set('n', '<leader>dj', dap.step_back, { desc = 'DAP: Step Back' })
    vim.keymap.set('n', '<leader>dr', dap.restart, { desc = 'DAP: Restart' })
    vim.keymap.set('n', '<leader>du', dapui.toggle, { desc = 'DAP: UI' })

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end
  end
}
