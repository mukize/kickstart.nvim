return {
  'epwalsh/obsidian.nvim',
  version = '*',
  lazy = true,
  ft = 'markdown',
  dependencies = {
    -- Required.
    'nvim-lua/plenary.nvim',
  },
  config = function()
    require('obsidian').setup {
      workspaces = {
        {
          name = 'personal',
          path = '~/obsidian-vaults/personal',
        },
        {
          name = 'uni',
          path = '~/obsidian-vaults/uni',
        },
      },
      daily_notes = {
        folder = 'dailies',
        date_format = '%Y-%m-%d',
      },
    }
    vim.keymap.set('n', '<leader>ow', '<cmd>ObsidianWorkspace<cr>', { desc = '[O]bsidian: [W]orkspaces' })
    vim.keymap.set('n', '<leader>os', '<cmd>ObsidianSearch<cr>', { desc = '[O]bsidian: [S]earch' })
    vim.keymap.set('n', '<leader>od', '<cmd>ObsidianToday<cr>', { desc = '[O]bsidian: [T]oday' })
  end,
}
