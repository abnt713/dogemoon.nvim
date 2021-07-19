local function load(plug)
  plug {'francoiscabrol/ranger.vim'}
end

local function configure(mapper)
  mapper.spacemap('ft', '<cmd>Ranger<CR>')
end

return {
  load = load,
  configure = configure,
}
