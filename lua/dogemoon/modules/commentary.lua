local commentary = {}

function commentary.load(plug)
  return function()
    plug {'tpope/vim-commentary'}
  end
end

function commentary.configure(mapper)
  return nil
end
return commentary
