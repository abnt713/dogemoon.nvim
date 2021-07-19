local doge = {}

function doge.load_plugins(modlist, projfile)
  local plugins = {
    list = {},
    loaded = {}
  }

  local plug = function(plugin_specification)
    if plugin_specification[1] == nil then 
      return
    end
    local plugin_id = plugin_specification[1]

    if plugins.loaded[plugin_id] then
      return
    end
    table.insert(plugins.list, plugin_specification)
    plugins.loaded[plugin_id] = true
  end

  local mapper = require 'dogemoon.utils'
  local projcfg = doge.read_project_file(projfile)

  for i, module_name in ipairs(modlist) do
    local mod = require('dogemoon.modules.' .. module_name)
    if mod.load ~= nil then
      mod.load(plug)
    end
  end

  require('paq-nvim')(plugins.list)

  for i, module_name in ipairs(modlist) do
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

function debug_highlight_group()
  local line = vim.fn.line(".")
  local col = vim.fn.col(".")
  local hi = vim.fn.synIDattr(vim.fn.synID(line, col, 1), "name")
  local trans = vim.fn.synIDattr(vim.fn.synID(line, col, 0), "name")
  local lo = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.synID(line, col, 1)), "name")

  print(string.format("[%s, %s] hi<%s> trans<%s> lo<%s>", line, col, hi, trans, lo))
end

function file_def()
  local file_reference = vim.fn.expand('%') .. ':' .. vim.fn.line('.')
  vim.fn.setreg('+', file_reference)
  print('"' .. file_reference .. '" copied to clipboard')
end

return function()
  vim.cmd 'packadd paq-nvim'
  local projfile = vim.fn.getcwd() .. '/dogeproject.json'
  doge.load_plugins(require 'dogemoon.plugins', projfile)
end
