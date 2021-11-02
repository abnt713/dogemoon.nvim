local function load(plug)
  plug {'akinsho/bufferline.nvim'}
end

local function configure(ctx)
  require("bufferline").setup{
    options = {
      separator_style = "slant"
    }
  }
  ctx.spacemap('h', '<cmd>BufferLineCyclePrev<CR>')
  ctx.spacemap('l', '<cmd>BufferLineCycleNext<CR>')
end

return {
  load = load;
  configure = configure;
}
