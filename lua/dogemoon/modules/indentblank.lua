local function load(plug)
  plug {'lukas-reineke/indent-blankline.nvim'}
end

local function configure()
  require("indent_blankline").setup {
    char = "¦",
    buftype_exclude = {"terminal"}
  }
end

return {
  load = load;
  configure = configure;
}
