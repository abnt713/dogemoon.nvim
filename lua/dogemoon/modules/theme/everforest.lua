local everforestmod = {}

function everforestmod.load(plug)
  return function()
    plug { 'sainnhe/everforest' }
  end
end

function everforestmod.configure()
  return function()
    vim.g.everforest_background = 'hard'
    vim.cmd 'colorscheme everforest'
  end
end

return everforestmod
