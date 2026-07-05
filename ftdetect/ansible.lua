vim.filetype.add {
  pattern = {
    -- Uses regex/wildcards (e.g., matching anything in a .config directory to 'config' type)
    ['.*/workflows/.*%.ya?ml'] = 'yaml.ansible',
  },
}
