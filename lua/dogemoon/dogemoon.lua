local modules_prefix = 'dogemoon.modules.'
local config_file_name = 'dogeproject.json'

local function get_modlist()
  return require 'dogemoon.plugins'
end

local function read_project_file(config_path) 
  if vim.fn.filereadable(config_path) == 0 then
    return nil
  end

  local contents = vim.fn.readfile(config_path)
  return vim.fn.json_decode(contents)
end

local function build_context()
  local mapper = require 'dogemoon.utils'
  local cfg_content = read_project_file(vim.fn.getcwd() .. '/' .. config_file_name)

  local project_config = {
    content = cfg_content,
  }

  project_config.get_type = function()
    if project_config.content == nil then return nil end
    return project_config.content["type"]
  end

  local go_scope = {}

  go_scope.concat_tags = function(sep)
    if project_config.content == nil then return nil end

    local arg_type = type(project_config.content.tags)
    if arg_type == "table" then
      return table.concat(project_config.content.tags, sep)
    end

    return nil
  end

  project_config.go = go_scope

  return {
    values = {},
    project_config = project_config,
    map = mapper.map,
    spacemap = mapper.spacemap,
    leadermap = mapper.leadermap,
  }
end

local function paq_manager()
  local paq = {
    list = {
      {'savq/paq-nvim'}
    },
    loaded = {
      'savq/paq-nvim'
    },
  }

  paq.load_description = function(description)
    if description == nil then
      return
    end

    local plugin_id = description[1]
    if plugin_id == nil then 
      return
    end

    if paq.loaded[plugin_id] then
      return
    end

    table.insert(paq.list, description)
    paq.loaded[plugin_id] = true
  end

  paq.load_plugins = function()
    vim.cmd 'packadd paq-nvim'
    require('paq')(paq.list)
  end

  return paq
end

local function to_the_moon()
  -- Step 1: Read all modules.  
  local modlist = get_modlist()

  -- Step 2: Build the context.
  local ctx = build_context()

  -- Step 3: Create descriptions and configurations hubs.
  local manager = paq_manager()
  local descriptions = {}
  local configurations = {}

  -- Step 3: Iterate over the mods for loading.
  for i, module_name in ipairs(modlist) do
    local mod = require(modules_prefix .. module_name)

    -- Load the plugin exposing the manager function.
    if mod.load ~= nil then
      mod.load(manager.load_description)
    end

    -- Add the configuration to the list.
    if mod.configure ~= nil then
      table.insert(configurations, mod.configure)
    end
  end

  -- Step 4: Load the plugins using the manager.
  manager.load_plugins()

  -- Step 5: Apply all configurations.
  for i, mod_configuration in ipairs(configurations) do
    mod_configuration(ctx)
  end
end

return {
  to_the_moon = to_the_moon,
}
