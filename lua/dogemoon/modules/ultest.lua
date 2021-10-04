local function load(plug)
  plug {'rcarriga/vim-ultest'}
end

local function configure_go_tests(ctx)
  if ctx.project_config.go.has_tags() then
    vim.g['ultest#go#gotest#options'] = {
      all = '-tags "' .. ctx.project_config.go.concat_tags(',') .. '"',
    }
  end
end

local function configure(ctx)
  vim.g['test#strategy'] = "floaterm"

  if ctx.project_config.get_type() == "go" then
    configure_go_tests(ctx)
  end

  ctx.spacemap('tf', '<cmd>UltestFile<CR>')
  ctx.spacemap('tn', '<cmd>UltestNearest<CR>')
  ctx.spacemap('ts', '<cmd>UltestSuite<CR>')
end

return {
  load = load,
  configure = configure,
}
