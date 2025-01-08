return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = function()
    require("which-key").add(
      {
        { '<leader>c', group = 'Code' },
        { '<leader>g', group = 'Git' },
        { '<leader>h', group = 'Harpoon' },
        { '<leader>s', group = 'Search' },
        { '<leader>t', group = 'Toggle' },
        { '<leader>w', group = 'Workspaces' },
      }
    );
  end,
}
