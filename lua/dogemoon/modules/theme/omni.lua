local omnimod = {}

function omnimod.load(plug)
  return function()
    plug {'yonlu/omni.vim'}
  end
end

function omnimod.configure()
  return function()
    vim.cmd 'colorscheme omni'
  end
end

return omnimod
