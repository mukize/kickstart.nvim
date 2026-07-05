vim.pack.add {
  'https://github.com/mfussenegger/nvim-ansible',
}

vim.treesitter.language.register('yaml', { 'yaml', 'yaml.ansible' })
