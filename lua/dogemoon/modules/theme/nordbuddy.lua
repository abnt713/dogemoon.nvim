local nordbuddymod = {}

function nordbuddymod.load(plug)
  return function()
    plug { 'tjdevries/colorbuddy.nvim' }
    plug { 'maaslalani/nordbuddy' }
  end
end

function nordbuddymod.configure()
  return function()
    require('colorbuddy').colorscheme('nordbuddy')
  end
end

return nordbuddymod
