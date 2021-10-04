local rigelmod = {}

function rigelmod.load(plug)
    plug {'Rigellute/rigel'}
end

function rigelmod.configure(ctx)
  vim.cmd [[ colorscheme rigel ]]
  ctx.values.set('lightline#theme', 'rigel')
end

return rigelmod
