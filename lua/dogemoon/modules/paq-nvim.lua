local paqnvim = {}

function paqnvim.load(plug, mapper)
  return function()
    plug {'savq/paq-nvim', opt=true}
  end
end

function paqnvim.configure(mapper)
  return function()
    mapper.spacemap('pu', '<cmd>PaqUpdate<CR>')
    mapper.spacemap('pc', '<cmd>PaqClean<CR>')
    mapper.spacemap('pi', '<cmd>PaqInstall<CR>')
  end
end

return paqnvim
