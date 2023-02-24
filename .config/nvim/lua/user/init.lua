return {
  default_theme = {
    highlights = function(hi)
      local C = require "default_theme.colors"
      hi.Normal = {bg = C.none, ctermbg = C.none}
      hi.CursorColumn = {cterm = {}, ctermbg = C.none, ctermfg = C.none}
      hi.CursorLine = {cterm = {}, ctermbg = C.none, ctermfg = C.none}
      hi.CursorLineNr = {cterm = {}, ctermbg = C.none, ctermfg = C.none}
      hi.LineNr = {}
      hi.SignColumn = {}
      hi.StatusLine = {}
      hi.NeoTreeNormal = {bg = C.none, ctermbg = C.none}
      hi.NeoTreeNormalNC = {bg = C.none, ctermbg = C.none}
      return hi
    end,
  },
}
