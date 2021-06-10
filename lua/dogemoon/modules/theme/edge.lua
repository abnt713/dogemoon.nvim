local edgemod = {}

function edgemod.load(plug)
  return function()
    plug {'sainnhe/edge'}
  end
end

function edgemod.configure()
  return function()
    vim.g.edge_style = "aura"
    vim.cmd [[ colorscheme edge ]]
  end
end

return edgemod
