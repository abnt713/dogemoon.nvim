local edgemod = {}

function edgemod.load(plug)
    plug {'sainnhe/edge'}
end

function edgemod.configure()
    vim.g.edge_style = "aura"
    vim.cmd [[ colorscheme edge ]]
end

return edgemod
