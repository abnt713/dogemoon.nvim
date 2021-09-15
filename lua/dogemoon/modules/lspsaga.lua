local function load(plug)
  plug {'glepnir/lspsaga.nvim'}
end

local function configure(ctx)
  local saga = require 'lspsaga'
  saga.init_lsp_saga()
end

return {
  load = load,
  configure = configure,
}
