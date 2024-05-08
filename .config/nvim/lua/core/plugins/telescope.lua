local telescope = require('telescope')
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')
local lga_actions = require('telescope-live-grep-args.actions')

vim.keymap.set('n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files({ hidden = true })<cr>",
    { noremap = true })
vim.keymap.set('n', '<leader>of', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fa', telescope.extensions.live_grep_args.live_grep_args, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

telescope.setup({
    defaults = {
        file_ignore_patterns = { "vendor", "node_modules", "target" },
        mappings = {
            i = {
                ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
            }
        },
    },
    extensions = {
        live_grep_args = {
            auto_quoting = true,
            mappings = {
                i = {
                    ["<C-k>"] = lga_actions.quote_prompt(),
                    ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " })
                },
            },
        }
    }
})
