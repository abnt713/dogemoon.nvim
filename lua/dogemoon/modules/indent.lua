local indentmod = {}

function indentmod.load(plug)
  plug {'Yggdroot/indentLine'}
end

function indentmod.configure()
  vim.api.nvim_exec([[
  autocmd VimEnter * if bufname('%') == '' | IndentLinesDisable | endif
  ]], false)

  vim.g.indentLine_first_char = "¦"
  vim.g.indentLine_showFirstIndentLevel = 1
end

return indentmod
