local function load(plug)
  plug {'arcticicestudio/nord-vim'} 
end

local function configure(ctx)
  ctx.values.set('lightline#theme', 'nord')
  vim.cmd [[ colorscheme nord ]]
end

return {
  load = load,
  configure = configure,
}
