local indentmod = {}

function indentmod.load(plug)
  return function()
    plug {'Yggdroot/indentLine'}
  end
end

function indentmod.configure()
  return function()
    vim.api.nvim_exec([[
      autocmd VimEnter * if bufname('%') == '' | IndentLinesDisable | endif
    ]], false)

    vim.g.indentLine_first_char = "¦"
    vim.g.indentLine_showFirstIndentLevel = 1
  end
end

return indentmod
