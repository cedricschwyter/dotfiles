require('nvim-treesitter.configs').setup({
    ensure_installed = { 'c', 'lua', 'rust', 'ruby', 'vim' },

    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<C-Space>",
            node_incremental = "<C-Space>",
        }
    }
})
