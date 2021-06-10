local nvimbase16 = {}

function nvimbase16.load(plug) 
  return function()
    plug {'RRethy/nvim-base16'}
  end
end

function nvimbase16.configure(mapper)
  return function()
    nvimbase16.apply_earthsong()
  end
end

function nvimbase16.apply_earthsong()
  local colorscheme = require 'dogemoon.misc.earthsong'
  require 'dogemoon.misc.base16apply'.apply(colorscheme)
  vim.cmd ("highlight NormalFloat ctermbg=0 guibg=" .. colorscheme.base01)
end

return nvimbase16
