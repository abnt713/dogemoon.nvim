local function load(plug)
  plug {'folke/twilight.nvim'}
end

local function configure()
  require('twilight').setup({})
end

return {
  load = load;
  configure = configure;
}
