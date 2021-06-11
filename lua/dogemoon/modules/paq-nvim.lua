local paqnvim = {}

function paqnvim.load(plug)
  plug {'savq/paq-nvim', opt=true}
end

function paqnvim.configure(mapper)
  mapper.spacemap('pu', '<cmd>PaqUpdate<CR>')
  mapper.spacemap('pc', '<cmd>PaqClean<CR>')
  mapper.spacemap('pi', '<cmd>PaqInstall<CR>')
end

return paqnvim
