local lightlinemod = {}

function lightlinemod.load(plug)
  plug {'itchyny/lightline.vim'}
  plug {'mengelbrecht/lightline-bufferline'}
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
    component_expand = {
      buffers = 'lightline#bufferline#buffers'
    },
    component_type = {
      buffers = 'tabsel'
    }
  }

  vim.o.showmode = false
end

return lightlinemod
