local colorizer = {}

function colorizer.load(plug)
  plug {'chrisbra/colorizer'}
end

function colorizer.configure(mapper)
  mapper.spacemap('cc', '<cmd>ColorToggle<CR>')
end

return colorizer
