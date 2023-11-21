require('lualine').setup({
    options = {
        icons_enabled = true,
        theme = 'gruvbox',
        globalstatus = true,
    },
    sections = {
        lualine_ = {
            {
                'filename',
                path = 1
            }
        }
    }
})
