local function load(plug)
  plug {'vim-test/vim-test'}
end

local function configure_go_tests(ctx)
  vim.g['test#go#gotest#options'] = {
    all = '-tags "' .. ctx.project_config.go.concat_tags(',') .. '"',
  }
end

local function configure(ctx)
  -- vim.g['test#strategy'] = "dispatch"

  if ctx.project_config.get_type() == "go" then
    configure_go_tests(ctx)
  end

  ctx.spacemap('tf', '<cmd>TestFile<CR>')
  ctx.spacemap('tn', '<cmd>TestNearest<CR>')
  ctx.spacemap('ts', '<cmd>TestSuite<CR>')
end

return {
  load = load,
  configure = configure,
}
