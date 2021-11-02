local function load(plug)
  plug {'mfussenegger/nvim-dap'}
  plug {'leoluz/nvim-dap-go'}
  plug {'rcarriga/nvim-dap-ui'}
end

local function maps(ctx)
  ctx.map('<C-Right>', [[<cmd>lua require'dap'.step_over()<CR>]], 'n', {silent = true})
  ctx.map('<C-Down>', [[<cmd>lua require'dap'.step_into()<CR>]], 'n', {silent = true})
  ctx.map('<C-Up>', [[<cmd>lua require'dap'.step_out()<CR>]], 'n', {silent = true})

  ctx.map('<C-Insert>', [[<cmd>lua require'dap'.toggle_breakpoint()<CR>]], 'n', {silent = true})
  ctx.map('<C-S-Insert>', [[<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint Condition: '))<CR>]], 'n', {silent = true})
  ctx.map('<C-Home>', [[<cmd>lua require'dap'.continue()<CR>]], 'n', {silent = true})
  ctx.map('<C-PageUp>', [[<cmd>lua require'dap'.repl.open({})<CR>]], 'n', {silent = true})
  ctx.leadermap('dl', [[<cmd>lua require'dap'.run_last()<CR>]], 'n', {silent = true})
end

local function configure(ctx)
  require('dap-go').setup()
  require("dapui").setup()
  maps(ctx)
end


return {
  load = load,
  configure = configure
}
