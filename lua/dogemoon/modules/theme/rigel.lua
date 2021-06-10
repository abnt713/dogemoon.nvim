local rigelmod = {}

function rigelmod.load(plug)
  return function()
    plug {'Rigellute/rigel'}
  end
end

function rigelmod.configure()
  return function()
    vim.cmd [[ colorscheme rigel ]]
  end
end

return rigelmod
