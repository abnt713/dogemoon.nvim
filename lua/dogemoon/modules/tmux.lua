local tmux = {}

function tmux.load(plug)
  return function()
    plug {'christoomey/vim-tmux-navigator'}
  end
end

function tmux.configure(mapper)
  return nil
end

return tmux
