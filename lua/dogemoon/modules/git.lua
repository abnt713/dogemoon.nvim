local gitmod = {}

function gitmod.load(plug)
  plug {'airblade/vim-gitgutter'}
  plug {'tpope/vim-fugitive'}
end

function gitmod.configure(mapper)
  mapper.spacemap('gs', '<cmd>Git<CR>')
  mapper.spacemap('gc', '<cmd>Git commit<CR>')
  mapper.spacemap('gb', '<cmd>Git blame<CR>')
  mapper.spacemap('gf', '<cmd>GFiles?<CR>')
  mapper.spacemap('gp', '<cmd>GitGutterPrevHunk<CR>')
  mapper.spacemap('gn', '<cmd>GitGutterNextHunk<CR>')
end

return gitmod
