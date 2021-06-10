local lightlinemod = {}

function lightlinemod.load(plug)
  return function()
    plug {'itchyny/lightline.vim'}
    plug {'mengelbrecht/lightline-bufferline'}
  end
end

function lightlinemod.configure()
  return function()
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
end

return lightlinemod
