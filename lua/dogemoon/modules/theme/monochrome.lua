local monochromemod = {}

function monochromemod.load(plug)
  return function()
    plug {'fxn/vim-monochrome'}
  end
end

function monochromemod.configure()
  return function()
    vim.cmd 'colorscheme monochrome'
  end
end

return monochromemod
