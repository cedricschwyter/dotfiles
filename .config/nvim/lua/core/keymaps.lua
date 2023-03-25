vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.guicursor = 'n-v-c-sm:block'

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
