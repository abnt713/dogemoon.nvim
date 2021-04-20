local gomod = {}

function gomod.load(plug)
  return function()
    plug {'mattn/vim-goimports'}
  end
end

function gomod.configure(mapper)
  return nil
end

return gomod
