return {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required
      "sindrets/diffview.nvim",        -- optional - Diff integration
      "nvim-telescope/telescope.nvim", -- optional
    },
    opts = function()
      local neogit = require("neogit")
      vim.keymap.set('n', '<leader>gn', neogit.open, { desc = "Git: Neogit" })
    end
  },
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup {
        signs = {
          add = { text = '+' },
          change = { text = '~' },
          delete = { text = '_' },
          topdelete = { text = '‾' },
          changedelete = { text = '~' },
        },
        numhl = false,
        on_attach = function()
          local gitsigns = require("gitsigns.actions")
          vim.keymap.set('n', '<leader>gh', gitsigns.preview_hunk, { desc = 'Git: Hunk Preview' })
          vim.keymap.set('n', '<leader>gw', gitsigns.toggle_word_diff, { desc = 'Git: Toggle Word Diff' })
          vim.keymap.set('n', '<leader>gb', gitsigns.blame, { desc = 'Git: Blame' })
        end }
    end,
  }
}
