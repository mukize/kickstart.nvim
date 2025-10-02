return {
  -- { 'folke/persistence.nvim', event = 'BufReadPre', opts = {} },
  {
    'rmagatti/auto-session',
    -- enabled = false,
    lazy = false,

    ---enables autocomplete for opts
    ---@module "auto-session"
    ---@type AutoSession.Config
    opts = {}
  },
  {
    'natecraddock/workspaces.nvim',
    config = function()
      local workspaces = require 'workspaces'
      workspaces.setup {
        hooks = {
          open_pre = { 'AutoSession save', '%bdelete', },
          open = { 'AutoSession restore' },
        },
      }
      vim.keymap.set('n', '<leader>wl', '<cmd>WorkspacesOpen<cr>', { desc = '[W]orkspaces: [L]ist' })
      vim.keymap.set('n', '<leader>wa', '<cmd>WorkspacesAdd<cr>', { desc = '[W]orkspaces: [A]dd' })
    end,
  },
}
