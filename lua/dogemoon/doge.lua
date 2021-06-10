local Lifecycle = {}
local doge = {}

function doge.run()
  vim.cmd 'packadd paq-nvim'
  local paq = require('paq-nvim').paq
  local mapper = require 'dogemoon.utils'
  local plugins = Lifecycle.new(paq, mapper)

  local projfile = vim.fn.getcwd() .. '/dogeproj.json'
  local projcfg = doge.read_project_file(projfile)

  plugins:load({
    'vim',
    'paq-nvim',
    'treesitter',
    'polyglot',
    -- 'dap',
    'telescope',
    'ale',
    'colorizer',
    'commentary',
    'compe',
    'editorconfig',
    'git',
    'indent',
    'lightline',
    'lsp',
    'nerdtree',
    'tmux',
    'go',
    'theme.edge'
  })

  plugins:execute(projcfg) 
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

function Lifecycle:execute(projcfg)
  for i, modplugins in ipairs(self.plugins) do
    modplugins()
  end

  for i, modsettings in ipairs(self.settings) do
    modsettings(projcfg)
  end
end

function doge.read_project_file(configfile) 
  if vim.fn.filereadable(configfile) == 0 then
    return nil
  end

  local contents = vim.fn.readfile(configfile)
  return vim.fn.json_decode(contents)
end

return doge
