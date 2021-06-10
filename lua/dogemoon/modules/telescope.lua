local telescopemod = {}

function telescopemod.load(plug)
  return function()
    plug {'nvim-lua/popup.nvim'}
    plug {'nvim-lua/plenary.nvim'}
    plug {'nvim-telescope/telescope.nvim'}
    plug {'nvim-telescope/telescope-dap.nvim'}
  end
end

function telescopemod.configure(mapper)
  return function()
    local telescope = require 'telescope'
    telescope.setup()
    -- telescope.load_extension('dap')

    mapper.spacemap('ff', '<cmd>Telescope find_files<CR>')
    mapper.spacemap('fg', '<cmd>Telescope live_grep<CR>')
    mapper.spacemap('fb', '<cmd>Telescope buffers<CR>')
    mapper.spacemap('fh', '<cmd>Telescope help_tags<CR>')
    mapper.spacemap('bb', '<cmd>Telescope buffers<CR>')

    -- mapper.spacemap('dc', '<cmd>Telescope dap commands<CR>')
    -- mapper.spacemap('ds', '<cmd>Telescope dap configurations<CR>')
    -- mapper.spacemap('dl', '<cmd>Telescope dap list_breakpoints<CR>')
    -- mapper.spacemap('dv', '<cmd>Telescope dap variables<CR>')
    -- mapper.spacemap('df', '<cmd>Telescope dap frames<CR>')
  end
end

return telescopemod
