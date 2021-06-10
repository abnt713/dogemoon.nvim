local base16apply = {}

function base16apply.apply(colorscheme)
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

return base16apply
