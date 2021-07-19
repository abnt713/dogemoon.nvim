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
    'markdown',
    'kotlin'
  }
  plug {'sheerun/vim-polyglot'}
end

return polyglotmod
