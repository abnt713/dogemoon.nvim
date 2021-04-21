local dapmod = {}

function dapmod.load(plug)
  return function()
    plug {'mfussenegger/nvim-dap'}
  end
end

function dapmod.configure(mapper)
  return function()
    mapper.spacemap('dd', [[<cmd>lua require'dap'.continue()<CR>]], 'n', {silent = true})
    mapper.spacemap('dl', [[<cmd>lua require'dap'.step_over()<CR>]], 'n', {silent = true})
    mapper.spacemap('dj', [[<cmd>lua require'dap'.step_into()<CR>]], 'n', {silent = true})
    mapper.spacemap('dk', [[<cmd>lua require'dap'.step_out()<CR>]], 'n', {silent = true})

    mapper.spacemap('db', [[<cmd>lua require'dap'.toggle_breakpoint()<CR>]], 'n', {silent = true})
    mapper.spacemap('dt', [[<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint Condition: '))<CR>]], 'n', {silent = true})
    mapper.spacemap('dt', [[<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>]], 'n', {silent = true})
    mapper.spacemap('dr', [[<cmd>lua require'dap'.repl.open()<CR>]], 'n', {silent = true})
    mapper.spacemap('df', [[<cmd>lua require'dap'.run_last()<CR>]], 'n', {silent = true})
  end
end
