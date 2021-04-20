local nvimbase16 = {}

function nvimbase16.load(plug) 
  return function()
    plug {'RRethy/nvim-base16'}
  end
end

function nvimbase16.configure(mapper)
  return function()
    require 'dogemoon.misc.earthsong'.apply()
  end
end

return nvimbase16
