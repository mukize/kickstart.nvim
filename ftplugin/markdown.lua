vim.treesitter.start()
vim.opt_local.spell = true
vim.opt_local.conceallevel = 2
vim.opt_local.wrap = true
vim.opt_local.linebreak = true
vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
