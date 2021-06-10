local neonmod = {}

function neonmod.load(plug)
  return function()
    plug {"rafamadriz/neon"}
  end
end

function neonmod.configure()
  return function()
    vim.cmd [[ colorscheme neon ]]
  end
end

return neonmod
