local ale = {}

function ale.load(plug)
  return function()
    plug {'dense-analysis/ale'}
  end
end

function ale.configure(mapper)
  return nil
end

return ale
