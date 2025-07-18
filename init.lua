require 'options'
require 'keymaps'

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end
vim.opt.rtp:prepend(lazypath)

----- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
-----

vim.diagnostic.config {
  severity_sort = true,
  virtual_text = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = ' ',
      [vim.diagnostic.severity.WARN] = ' ',
      [vim.diagnostic.severity.HINT] = ' ',
      [vim.diagnostic.severity.INFO] = ' ',
    },
    texthl = {
      [vim.diagnostic.severity.ERROR] = 'DiagnosticSignError',
      [vim.diagnostic.severity.WARN] = 'DiagnosticSignWarn',
      [vim.diagnostic.severity.HINT] = 'DiagnosticSignHint',
      [vim.diagnostic.severity.INFO] = 'DiagnosticSignInfo',
    },
    linehl = {
      [vim.diagnostic.severity.ERROR] = '',
      [vim.diagnostic.severity.WARN] = '',
      [vim.diagnostic.severity.HINT] = '',
      [vim.diagnostic.severity.INFO] = '',
    }
  }
}
vim.keymap.set('n', '<A-d>', vim.diagnostic.open_float, { desc = '[D]iagnostic Float' })
vim.keymap.set('n', '[d', function()
  vim.diagnostic.jump({ count = -1, float = true })
end, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', function()
  vim.diagnostic.jump({ count = 1, float = true })
end, { desc = 'Go to next [D]iagnostic message' })
-----

---- statusline
require('lazy').setup {

  'tpope/vim-sleuth',
  { 'numToStr/Comment.nvim', opts = {} },
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
    build = ':TSUpdate',
    opts = {
      ensure_installed = { 'bash', 'diff', 'html', 'lua', 'luadoc', 'markdown' },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
      treesitter_context = { enable = true },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ['af'] = { query = '@function.outer', desc = 'Select outer part of a function region' },
            ['if'] = { query = '@function.inner', desc = 'Select inner part of a function region' },
            ['ac'] = { query = '@class.outer', desc = 'Select outer part of a class region' },
            ['ic'] = { query = '@class.inner', desc = 'Select inner part of a class region' },
          },
          selection_modes = {
            ['@parameter.outer'] = 'v',
            ['@function.outer'] = 'V',
            ['@class.outer'] = '<c-v>',
          },
          include_surrounding_whitespace = true,
        },
      },
    },
    config = function(_, opts)
      local treesitter = require("nvim-treesitter.configs")
      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

      parser_config.gleam = {
        install_info = {
          url = "https://github.com/gleam-lang/tree-sitter-gleam",
          revision = "main",
          files = { "src/parser.c", "src/scanner.c" },
        },
        filetype = "gleam",
      }
      -- Prefer git instead of curl in order to improve connectivity in some environments
      require('nvim-treesitter.install').prefer_git = true
      ---@diagnostic disable-next-line: missing-fields
      require('nvim-treesitter.configs').setup(opts)
    end,
  },
  { import = 'plugins' },
}
