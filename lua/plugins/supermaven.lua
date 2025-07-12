return {
  "supermaven-inc/supermaven-nvim",
  config = function()
    require("supermaven-nvim").setup({})
    vim.keymap.set('n', '<leader>ts', require('supermaven-nvim.api').toggle, { desc = '[T]oggle SuperMaven' })
  end,
}
