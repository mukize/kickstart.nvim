---@diagnostic disable: missing-fields
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == 'nvim-treesitter' and kind == 'update' then
      if not ev.data.active then
        vim.cmd.packadd 'nvim-treesitter'
      end
      vim.cmd 'TSUpdate'
    end
  end,
})

vim.pack.add {
  'https://github.com/nvim-treesitter/nvim-treesitter-textobjects',
  'https://github.com/nvim-treesitter/nvim-treesitter',
}

vim.keymap.set({ 'x', 'o' }, 'af', function()
  require('nvim-treesitter-textobjects.select').select_textobject('@function.outer', 'textobjects')
end)

vim.keymap.set({ 'x', 'o' }, 'if', function()
  require('nvim-treesitter-textobjects.select').select_textobject('@function.inner', 'textobjects')
end)

require('nvim-treesitter-textobjects').setup {
  select = {
    lookahead = true,
    selection_modes = {
      ['@parameter.outer'] = 'v',
      ['@function.outer'] = 'v',
      ['@class.outer'] = '<c-v>',
    },
    include_surrounding_whitespace = true,
  },
}
vim.api.nvim_create_autocmd('User', {
  pattern = 'TSUpdate',
  callback = function()
    require('nvim-treesitter.parsers').minizinc = {
      install_info = {
        url = 'https://github.com/shackle-rs/shackle',
        branch = 'develop',
        location = 'parsers/tree-sitter-minizinc',
      },
    }
    require('nvim-treesitter.parsers').datazinc = {
      install_info = {
        url = 'https://github.com/shackle-rs/shackle',
        branch = 'develop',
        location = 'parsers/tree-sitter-datazinc',
      },
    }
  end,
})

local treesitter_langs = {
  'astro',
  'bash',
  'clojure',
  'css',
  'diff',
  'datazinc',
  'groovy',
  'gitignore',
  'html',
  'ini',
  'java',
  'javascript',
  'python',
  'racket',
  'ruby',
  'typescript',
  'typst',
  'yaml',
  'nix',
  'minizinc',
}

require('nvim-treesitter').install(treesitter_langs)

vim.api.nvim_create_autocmd('FileType', {
  pattern = treesitter_langs,
  callback = function()
    vim.treesitter.start()
    -- vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    -- vim.wo[0][0].foldmethod = 'expr'
    -- vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
