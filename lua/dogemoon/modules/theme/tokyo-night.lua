local tokyonightmod = {}

function tokyonightmod.load(plug)
  return function()
    plug {'folke/tokyonight.nvim'}
  end
end

function tokyonightmod.configure()
  return function()
    vim.cmd 'colorscheme tokyonight'
  end
end

return tokyonightmod
