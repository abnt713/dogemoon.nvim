local lightlinemod = {}

function lightlinemod.load(plug)
  plug {'itchyny/lightline.vim'}
  plug {'mengelbrecht/lightline-bufferline'}
end

function lightlinemod.configure()
  vim.g.lightline = {
    colorscheme = 'wombat',
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
end

return lightlinemod
