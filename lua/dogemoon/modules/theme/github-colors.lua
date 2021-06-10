local githubcolorsmod = {}

function githubcolorsmod.load(plug)
  return function()
    plug {'lourenci/github-colors'}
  end
end

function githubcolorsmod.configure()
  return function()
    vim.cmd [[ colorscheme github-colors ]]
  end
end

return githubcolorsmod
