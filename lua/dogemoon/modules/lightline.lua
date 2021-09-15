local lightlinemod = {}

function lightlinemod.load(plug)
  plug {'itchyny/lightline.vim'}
end

function lightlinemod.configure(ctx)
  local theme = ctx.values.get('lightline#theme', 'wombat')
  vim.g.lightline = {
    colorscheme = theme,
    active = {
      left = {{'mode', 'paste'}, {'readonly', 'filename', 'modified'}}
    },
    tabline = {
      left = {{'buffers'}},
      right = {{'close'}}
    },
  }

  vim.o.showmode = false
end

return lightlinemod
