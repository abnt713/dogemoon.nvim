local oceanic = {}

function oceanic.load(plug)
  return function()
    plug {'mhartington/oceanic-next'}
  end
end

function oceanic.configure()
  return function()
    vim.cmd 'colorscheme OceanicNext'
  end
end

return oceanic
