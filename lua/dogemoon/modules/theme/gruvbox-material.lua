local gruvmaterialmod = {}

function gruvmaterialmod.load(plug)
  return function()
    plug {'sainnhe/gruvbox-material'}
  end
end

function gruvmaterialmod.configure()
  return function()
    vim.g.gruvbox_material_background = 'medium'
    vim.cmd 'colorscheme gruvbox-material'
  end
end

return gruvmaterialmod
