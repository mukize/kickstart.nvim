return {
  'echasnovski/mini.nvim',
  config = function()
    require('mini.ai').setup { n_lines = 500 }
    require('mini.surround').setup()
    require('mini.pairs').setup()

    ----- splitjoin
    local splitjoin = require 'mini.splitjoin'
    splitjoin.setup { mappings = { toggle = '' } }
    vim.keymap.set('n', '<leader>cj', splitjoin.toggle, { desc = '[C]ode: Split/[J]oin Surronds' })
    -----

    ----- mini files
    local files = require 'mini.files'
    local files_prefix = function(fs_entry)
      local icon, group = files.default_prefix(fs_entry)
      return icon .. ' ', group
    end
    files.setup { content = { prefix = files_prefix } }
    vim.keymap.set('n', '<Leader>e', function()
      require('mini.files').open(vim.api.nvim_buf_get_name(0))
    end, { desc = '[E]xplorer' })
    -----

    ----- statusline
    local statusline = require 'mini.statusline'
    statusline.setup {
      use_icons = vim.g.have_nerd_font,
      content = {
        active = function()
          local filename = ''
          if vim.bo.buftype == 'terminal' then
            filename = '%t'
          else
            filename = '%f %m %r'
          end
          local fileinfo = vim.bo.filetype
          local search = statusline.section_searchcount { trunc_width = 75 }
          local diagnostics = statusline.section_diagnostics {
            icon = 'LSP:',
            trunc_width = 75,
            signs = { ERROR = ' ', WARN = ' ', HINT = ' ', INFO = ' ' },
          }
          local location = '%2l:%-2v'

          return statusline.combine_groups {
            { hl = 'MiniStatuslineDevinfo', strings = { filename } },
            '%<', -- Mark general truncate point
            { hl = 'MiniStatuslineDevinfo', strings = { diagnostics } },
            '%=', -- End left alignment
            { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
            { hl = 'MiniStatuslineFileinfo', strings = { search, location } },
          }
        end,
        inactive = function()
          return '%s%m'
        end,
      },
    }
    ----
  end,
}
