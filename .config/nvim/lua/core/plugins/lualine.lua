require('lualine').setup({
  options = {
    icons_enabled = true,
    theme = 'gruvbox',
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
