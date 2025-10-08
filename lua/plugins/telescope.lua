return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'nvim-tree/nvim-web-devicons',            enabled = vim.g.have_nerd_font },
  },
  config = function()
    require('telescope').setup {
      defaults = {
        layout_config = { prompt_position = 'top' },
        sorting_strategy = 'ascending',
      },
      pickers = {
        diagnostics = {
          theme = 'dropdown',
          previewer = true,
        },
        colorschemes = {
          enable_preview = true,
        },
        buffers = {
          mappings = {
            n = { ['<c-d>'] = require('telescope.actions').delete_buffer },
            i = { ['<c-d>'] = require('telescope.actions').delete_buffer },
          },
        },
      },
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    }

    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

    local builtin = require 'telescope.builtin'
    vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch: [G]rep' })
    vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = '[S]earch: [B]uffers' })
    vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch: [D]iagnostics' })
    vim.keymap.set('n', '<leader><leader>', builtin.find_files, { desc = 'Find Files' })

    -- vim.keymap.set('n', '<leader>gs', builtin.git_status, { desc = '[G]it: [S]tatus' })
    -- vim.keymap.set('n', '<leader>gb', builtin.git_branches, { desc = '[G]it: [B]ranch' })
  end,
}
