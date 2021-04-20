local gitmod = {}

function gitmod.load(plug)
  return function()
    plug {'airblade/vim-gitgutter'}
    plug {'tpope/vim-fugitive'}
  end
end

function gitmod.configure(mapper)
  return function()
    mapper.spacemap('gs', '<cmd>Git<CR>')
    mapper.spacemap('gc', '<cmd>Git commit<CR>')
    mapper.spacemap('gb', '<cmd>Git blame<CR>')
    mapper.spacemap('gf', '<cmd>GFiles?<CR>')
  end
end

return gitmod
