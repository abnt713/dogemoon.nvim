local bluemoonmod = {}

function bluemoonmod.load(plug)
  return function()
    plug {'kyazdani42/blue-moon'}
  end
end

function bluemoonmod.configure()
  return function()
    vim.cmd 'colorscheme blue-moon'
  end
end

return bluemoonmod
