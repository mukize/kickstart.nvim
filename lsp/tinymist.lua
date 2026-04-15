return {
  cmd = { 'tinymist' },
  filetypes = { 'typst' },
  root_markers = { '.git', 'main.typ', 'typst.toml' },
  settings = {
    exportPdf = 'onSave',
    formatterMode = 'typstyle',
    formatterPrintWidth = 100,
    semanticTokens = 'disable',
  },
}
