local doge = {}

function doge.load_plugins(plugins, projfile)
  local paq = require('paq-nvim').paq
  local mapper = require 'dogemoon.utils'
  local projcfg = doge.read_project_file(projfile)

  for i, module_name in ipairs(plugins) do
    local mod = require('dogemoon.modules.' .. module_name)
    if mod.load ~= nil then
      mod.load(paq)
    end
  end

  for i, module_name in ipairs(plugins) do
    local mod = require('dogemoon.modules.' .. module_name)
    if mod.configure ~= nil then
      local cfg = projcfg
      if mod.config_schema ~= nil then
        local mod_namespace, mod_schema = mod.config_schema()
        cfg = doge.extract_config(projcfg, mod_namespace, mod_schema)
      end
      mod.configure(mapper, cfg)
    end
  end
end

function doge.extract_config(projcfg, mod_namespace, mod_schema)
  if projcfg == nil or projcfg[mod_namespace] == nil then
    return mod_schema
  end

  return doge.merge_configs(mod_schema, projcfg[mod_namespace])
end

function doge.merge_configs(mod_schema, mod_config)
  for k,v in pairs(mod_config) do
    if type(v) == 'table' and type(mod_schema[k]) == 'table' then
      mod_schema[k] = doge.merge_configs(mod_schema[k], mod_config[k])
    elseif k ~= nil then
      mod_schema[k] = mod_config[k]
    end
  end
  return mod_schema
end

function doge.read_project_file(configfile) 
  if vim.fn.filereadable(configfile) == 0 then
    return nil
  end

  local contents = vim.fn.readfile(configfile)
  return vim.fn.json_decode(contents)
end

return function()
  vim.cmd 'packadd paq-nvim'
  local projfile = vim.fn.getcwd() .. '/dogeproject.json'

  plugins = {
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
  }
  doge.load_plugins(plugins, projfile)
end
