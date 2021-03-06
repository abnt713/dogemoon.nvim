local function load(plug)
  plug {'hoob3rt/lualine.nvim'}
  plug {'kyazdani42/nvim-web-devicons'}
end

local function configure(ctx)
  local theme = ctx.values.get('lualine#theme', 'gruvbox')
  require'lualine'.setup {
    options = {
      icons_enabled = true,
      theme = theme,
      component_separators = {'', ''},
      section_separators = {'', ''},
      disabled_filetypes = {}
    },
    sections = {
      lualine_a = {'mode'},
      lualine_b = {'branch'},
      lualine_c = {'filename'},
      lualine_x = {'encoding', 'fileformat', 'filetype'},
      lualine_y = {'progress'},
      lualine_z = {'location'}
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {'filename'},
      lualine_x = {'location'},
      lualine_y = {},
      lualine_z = {}
    },
    tabline = {},
    extensions = {}
  }
end

return {
  load = load;
  configure = configure;
}
