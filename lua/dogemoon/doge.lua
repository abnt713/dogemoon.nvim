local Lifecycle = {}
local doge = {}

function doge.run()
  vim.cmd 'packadd paq-nvim'
  local paq = require('paq-nvim').paq
  local mapper = require 'dogemoon.utils'
  local plugins = Lifecycle.new(paq, mapper)

  plugins:load({
    'vim',
    
    'treesitter',

    'ale',
    'colorizer',
    'commentary',
    'compe',
    'editorconfig',
    'fzf',
    'git',
    'indent',
    'lightline',
    'lsp',
    'nerdtree',
    'nvim-base16',
    'paq-nvim',
    'tmux',
  })

  plugins:execute() 
end

Lifecycle.__index = Lifecycle

function Lifecycle.new(plug, mapper)
  local self = setmetatable({}, Lifecycle)
  self.plugins = {}
  self.settings = {}
  
  self.plug = plug
  self.mapper = mapper

  return self
end

function Lifecycle:load(modules)
  for i,module_name in ipairs(modules) do
    self:attach(module_name)
  end
end

function Lifecycle:attach(module_name)
  local dogemodule = require('dogemoon.modules.' .. module_name)
  local modplugins = dogemodule.load(self.plug)
  local modsettings = dogemodule.configure(self.mapper)

  if modplugins then
    table.insert(self.plugins, modplugins)
  end

  if modsettings then
    table.insert(self.settings, modsettings)
  end
end

function Lifecycle:execute()
  for i, modplugins in ipairs(self.plugins) do
    modplugins()
  end

  for i, modsettings in ipairs(self.settings) do
    modsettings()
  end
end

return doge
