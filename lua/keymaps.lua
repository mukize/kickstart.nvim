vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('n', '<M-w>', '<cmd>w<cr>', { desc = '[W]rite' })
vim.keymap.set('n', '<M-q>', '<cmd>q<cr>', { desc = '[Q]uit' })

vim.keymap.set({ 'n', 'v' }, '<leader>r', ':s//g<left><left>', { desc = '[R]eplace' })

if vim.g.vscode then
  return
end

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
