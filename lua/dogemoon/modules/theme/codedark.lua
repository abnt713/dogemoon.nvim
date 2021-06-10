local codedarkmod = {}

function codedarkmod.load(plug)
  return function()
    plug {'tomasiser/vim-code-dark'}
  end
end

function codedarkmod.configure()
  return function()
    vim.cmd 'colorscheme codedark'
  end
end

return codedarkmod
