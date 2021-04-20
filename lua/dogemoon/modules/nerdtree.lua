local nerdtreemod = {}

function nerdtreemod.load(plug)
  return function()
    plug {'preservim/nerdtree'}
    plug {'ryanoasis/vim-devicons'}
  end
end

function nerdtreemod.configure(mapper)
  return function()
    mapper.spacemap('ft', '<cmd>NERDTreeToggle<CR>')
  end
end

return nerdtreemod
