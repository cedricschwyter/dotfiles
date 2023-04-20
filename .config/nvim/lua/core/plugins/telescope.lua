local telescope = require('telescope')
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>of', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

telescope.setup({
    defaults = {
        mappings = {
            i = {
                ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
            }
        }
    }
})
