return {
  'ibhagwan/fzf-lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('fzf-lua').setup { 'borderless' }

    vim.keymap.set('n', '<leader><leader>', '<cmd>FzfLua files<cr>', { desc = 'Fzf Files' })
    vim.keymap.set('n', '<leader>fg', '<cmd>FzfLua live_grep_native<cr>', { desc = '[F]zf: [G]rep (live native)' })

    vim.keymap.set('n', '<leader>gs', '<cmd>FzfLua git_status winopts.fullscreen=true<cr>', { desc = '[G]it: [S]tatus' })
    vim.keymap.set('n', '<leader>gb', '<cmd>FzfLua git_branches winopts.fullscreen=true<cr>', { desc = '[G]it: [B]ranches' })

    local diag_opts = 'winopts.width=0.6 winopts.preview.layout="vertical"'
    vim.keymap.set('n', '<leader>dd', '<cmd>FzfLua diagnostics_document ' .. diag_opts .. '<cr>', { desc = '[D]iagnostics: [D]ocument' })
    vim.keymap.set('n', '<leader>dw', '<cmd>FzfLua diagnostics_workspace ' .. diag_opts .. '<cr>', { desc = '[D]iagnostics: [W]orkspace' })
  end,
}
