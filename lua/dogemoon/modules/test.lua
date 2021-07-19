local function load(plug)
  plug {'vim-test/vim-test'}
end

local function configure(mapper)
  mapper.spacemap('tf', '<cmd>TestFile<CR>')
  mapper.spacemap('tn', '<cmd>TestNearest<CR>')
  mapper.spacemap('ts', '<cmd>TestSuite<CR>')
end

return {
  load = load,
  configure = configure,
}
