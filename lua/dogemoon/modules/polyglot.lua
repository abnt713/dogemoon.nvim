local polyglotmod = {}

function polyglotmod.load(plug)
  vim.g.polyglot_disabled = {
    'go',
    'css',
    'php',
    'python',
    'c',
    'cpp',
    'lua',
    'yaml',
    'yml',
    'sensible',
  }
  return function()
    plug {'sheerun/vim-polyglot'}
  end
end

function polyglotmod.configure(mapper)
  return nil
end

return polyglotmod
