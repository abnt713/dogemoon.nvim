local sonokaimod = {}

function sonokaimod.load(plug)
  return function()
    plug {'sainnhe/sonokai'}
  end
end

function sonokaimod.configure()
  return function()
    -- vim.g.sonokai_style = 'shusia'
    vim.cmd 'colorscheme sonokai'
  end
end

return sonokaimod
