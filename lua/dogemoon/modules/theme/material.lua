local material = {}

function material.load(plug)
  return function()
    plug {'marko-cerovac/material.nvim'}
  end
end

function material.configure()
  return function()
    vim.g.material_style = "oceanic"
    require('material').set()
  end
end

return material
