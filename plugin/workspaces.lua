vim.pack.add {
  'https://github.com/rmagatti/auto-session',
  'https://github.com/natecraddock/workspaces.nvim',
}

require('auto-session').setup {}
require('workspaces').setup {
  hooks = {
    open_pre = { 'AutoSession save', '%bdelete' },
    open = { 'AutoSession restore' },
  },
}
vim.keymap.set('n', '<leader>wl', '<cmd>WorkspacesOpen<cr>', { desc = '[W]orkspaces: [L]ist' })
vim.keymap.set('n', '<leader>wa', '<cmd>WorkspacesAdd<cr>', { desc = '[W]orkspaces: [A]dd' })
