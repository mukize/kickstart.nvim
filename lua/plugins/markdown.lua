return {
  { 'jbyuki/nabla.nvim', ft = 'markdown' },
  { 'Kicamon/markdown-table-mode.nvim', ft = 'markdown' },
  { '3rd/image.nvim', ft = 'markdown' },
  {
    'lukas-reineke/headlines.nvim',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    ft = 'markdown',
    opts = { markdown = { headline_highlights = false } },
  },
  {
    'epwalsh/obsidian.nvim',
    version = '*',
    lazy = true,
    ft = 'markdown',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      workspaces = {
        { name = 'personal', path = '~/obsidian-vaults/personal' },
        { name = 'uni', path = '~/obsidian-vaults/uni' },
      },
      daily_notes = { folder = 'dailies', date_format = '%Y-%m-%d' },
      ui = {
        enable = true, -- set to false to disable all additional syntax features
        -- update_debounce = 200, -- update delay after a text change (in milliseconds)
        -- max_file_length = 5000, -- disable UI features for files with more than this many lines
        checkboxes = {
          [' '] = { char = '󰄱', hl_group = 'ObsidianTodo' },
          ['x'] = { char = '', hl_group = 'ObsidianDone' },
        },
      },
      disable_frontmatter = true,
      follow_url_func = function(url)
        vim.cmd(':silent exec "!start ' .. url .. '"')
      end,
      mappings = {
        ['gf'] = {
          action = function()
            return require('obsidian').util.gf_passthrough()
          end,
          opts = { noremap = false, expr = true, buffer = true },
        },
        ['<leader>ch'] = {
          action = function()
            return require('obsidian.util').toggle_checkbox()
          end,
          opts = { buffer = true },
        },
        ['<cr>'] = {
          action = function()
            return require('obsidian.util').smart_action()
          end,
          opts = { buffer = true, expr = true },
        },
        ['<leader>o'] = {
          action = function()
            return '<cmd>ObsidianOpen<cr>'
          end,
          opts = { buffer = true, expr = true },
        },
        ['<leader>l'] = {
          action = function()
            return '<cmd>ObsidianTOC<cr>'
          end,
          opts = { buffer = true, expr = true },
        },
      },
    },
  },
}
