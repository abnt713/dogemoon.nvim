local palenightmod = {}

function palenightmod.load(plug)
  return function()
    plug {'Cybolic/palenight.vim'}
  end
end

function palenightmod.configure()
  return function()
    vim.o.background = 'dark'
    vim.cmd [[ colorscheme palenight ]]
  end
end

return palenightmod
