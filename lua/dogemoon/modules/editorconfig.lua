local editorconfig = {}

function editorconfig.load(plug)
  return function()
    plug {'editorconfig/editorconfig-vim'}
  end
end

function editorconfig.configure(mapper)
  return nil
end

return editorconfig
