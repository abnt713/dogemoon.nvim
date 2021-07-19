local everforestmod = {}

function everforestmod.load(plug)
    plug { 'sainnhe/everforest' }
end

function everforestmod.configure()
    vim.g.everforest_background = 'hard'
    vim.cmd 'colorscheme everforest'
end

return everforestmod
