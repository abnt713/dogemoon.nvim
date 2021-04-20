local earthsong = {}

local colorscheme = {
  -- Background
  base00 = '#292520',
  -- Current line background
  base01 = '#3e3b36',
  -- Visual selection
  base02 = '#3e3b36',
  -- Commentaries
  base03 = '#6c7891',
  -- Line numbers
  base04 = '#675f54',
  -- Autocomplete selection color
  base05 = '#abb2bf',
  -- No idea
  base06 = '#565c64',
  -- No Idea
  base07 = '#c5c8e6',
  -- Variables
  base08 = '#e5c6aa',
  -- Integers, bool
  base09 = '#1398b9',
  -- Types
  base0A = '#56b6c2',
  -- Strings and literals
  base0B = '#d0633d',
  -- Brackets
  base0C = '#56b6c2',
  -- Function names
  base0D = '#f5ae2e',
  -- Keywords
  base0E = '#f6f7ec',
  -- 
  base0F = '#56b6c2',
}

function earthsong.apply()
  require('base16-colorscheme').setup(colorscheme)
  vim.cmd('highlight NonText guifg=' .. colorscheme.base00)
  vim.cmd('highlight CustomIndentGuides guifg=' .. colorscheme.base06)
  vim.cmd('match CustomIndentGuides /\t/')
  vim.api.nvim_exec([[
  augroup custom_highlighting
  autocmd!
  autocmd VimEnter,WinEnter * match CustomIndentGuides /\t/
  augroup END
    ]], false)
  vim.g.indentLine_defaultGroup = 'CustomIndentGuides'
end

return earthsong
