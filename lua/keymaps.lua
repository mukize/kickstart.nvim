vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set({ 'n', 'v' }, 'j', 'gj')
vim.keymap.set({ 'n', 'v' }, 'k', 'gk')

vim.keymap.set('n', '<M-w>', '<cmd>w<cr>', { desc = '[W]rite' })
vim.keymap.set('n', '<M-q>', '<cmd>q<cr>', { desc = '[Q]uit' })

vim.keymap.set({ 'n', 'v' }, '<leader>cs', ':s//g<left><left>', { desc = '[C]ode: [S]ubsitute' })

vim.keymap.set("n", "<ScrollWheelUp>", "<C-y>", { noremap = true })
vim.keymap.set("n", "<ScrollWheelDown>", "<C-e>", { noremap = true })
