local moonlightmod = {}

function moonlightmod.load(plug)
  return function()
    plug {'shaunsingh/moonlight.nvim'}
  end
end

function moonlightmod.configure()
  return function()
    require('moonlight').set()
  end
end

return moonlightmod
