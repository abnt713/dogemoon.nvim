local fzf = {}

function fzf.load(plug)
  return function()
    plug {'junegunn/fzf'}
    plug {'junegunn/fzf.vim'}
  end
end

function fzf.configure(mapper)
  return function()
    mapper.spacemap('ff', '<cmd>Files<CR>')
    mapper.spacemap('fs', '<cmd>Ag<CR>')
    mapper.spacemap('b', '<cmd>Buffers<CR>')
  end
end

return fzf
