local function load(plug)
  plug {'mfussenegger/nvim-dap'}
  plug {'leoluz/nvim-dap-go'}
  plug {'rcarriga/nvim-dap-ui'}
end

local function maps(ctx)
  ctx.map('<F5>', [[<cmd>lua require'dap'.continue()<CR>]], 'n', {silent = true})
  ctx.map('<F6>', [[<cmd>lua require'dap'.step_over()<CR>]], 'n', {silent = true})
  ctx.map('<F7>', [[<cmd>lua require'dap'.step_into()<CR>]], 'n', {silent = true})
  ctx.map('<F8>', [[<cmd>lua require'dap'.step_out()<CR>]], 'n', {silent = true})

  ctx.leadermap('b', [[<cmd>lua require'dap'.toggle_breakpoint()<CR>]], 'n', {silent = true})
  ctx.leadermap('B', [[<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint Condition: '))<CR>]], 'n', {silent = true})
  ctx.leadermap('l', [[<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>]], 'n', {silent = true})
  ctx.leadermap('R', [[<cmd>lua require'dap'.repl.open({})<CR>]], 'n', {silent = true})
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
