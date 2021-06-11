local fzf = {}

function fzf.load(plug)
  plug {'junegunn/fzf'}
  plug {'junegunn/fzf.vim'}
end

function fzf.configure(mapper)
  mapper.spacemap('ff', '<cmd>Files<CR>')
  mapper.spacemap('fs', '<cmd>Ag<CR>')
  mapper.spacemap('b', '<cmd>Buffers<CR>')
end

return fzf
