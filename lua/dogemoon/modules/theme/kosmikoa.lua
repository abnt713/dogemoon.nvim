local kosmikoamod = {}

function kosmikoamod.load(plug)
  return function()
    plug {'novakne/kosmikoa.nvim'}
  end
end

function kosmikoamod.configure()
  return function()
    require ('kosmikoa').setup()
  end
end

return kosmikoamod
