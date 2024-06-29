return {
  '/natecraddock/workspaces.nvim',
  config = function()
    local workspaces = require 'workspaces'
    workspaces.setup {
      hooks = {
        open_pre = {
          "lua require('persistence').save()",
          "lua require('persistence').stop()",
          'silent %bdelete!',
        },
        open = { 'lua require("persistence").load()' },
      },
    }
    vim.keymap.set('n', '<leader>wl', '<cmd>WorkspacesOpen<cr>', { desc = '[W]orkspaces: [L]ist' })
    vim.keymap.set('n', '<leader>wa', '<cmd>WorkspacesAdd<cr>', { desc = '[W]orkspaces: [A]dd' })
  end,
}
