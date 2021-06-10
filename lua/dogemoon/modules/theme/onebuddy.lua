local onebuddymod = {}

function onebuddymod.load(plug)
  return function()
    plug {'tjdevries/colorbuddy.vim'}
    plug {'Th3Whit3Wolf/onebuddy'}
  end
end

function onebuddymod.configure(mapper)
  return function()
    require('colorbuddy').colorscheme('onebuddy')
  end
end

return onebuddymod
