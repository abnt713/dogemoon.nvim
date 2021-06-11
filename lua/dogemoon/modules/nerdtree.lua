local nerdtreemod = {}

function nerdtreemod.load(plug)
  plug {'preservim/nerdtree'}
  plug {'ryanoasis/vim-devicons'}
end

function nerdtreemod.configure(mapper)
  mapper.spacemap('ft', '<cmd>NERDTreeToggle<CR>')
end

return nerdtreemod
