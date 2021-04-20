local lspmod = {}

function lspmod.load(plug)
  return function()
    plug {'neovim/nvim-lspconfig'}
    plug {'nvim-lua/completion-nvim'}
    plug {'nvim-lua/lsp_extensions.nvim'}
    plug {'ojroques/nvim-lspfuzzy'}
  end
end

function lspmod.configure(mapper)
  return function()
    lspmod.setup()
    lspmod.maps(mapper)
  end
end

function lspmod.setup()
  local lspcfg = require 'lspconfig'
  local lspfuzzy = require 'lspfuzzy'

  local project_cfg = lspmod.read_local_configs()

  lspcfg.gopls.setup(project_cfg.gopls)
  lspcfg.intelephense.setup({})
  lspfuzzy.setup{}

  vim.lsp.handlers["textDocument/publishDiagnostics"] = function()
  end

  vim.g.ale_lint_on_text_changed = 'never'
  vim.g.ale_lint_on_insert_leave = 0
  vim.g.ale_lint_on_enter = 0
end

function lspmod.default_configs()
  return {
    gopls = {}
  }
end

function lspmod.read_local_configs() 
  local configfile = vim.fn.getcwd() .. '/nvim.local.json'
  if vim.fn.filereadable(configfile) == 0 then
    return lspmod.default_configs()
  end

  local contents = vim.fn.readfile(configfile)
  return vim.fn.json_decode(contents)
end

function lspmod.maps(mapper)
  mapper.map('ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
  mapper.map('gh', '<cmd>lua vim.lsp.buf.hover()<CR>')
  mapper.map('gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
  mapper.map('gr', '<cmd>lua vim.lsp.buf.references()<CR>')
  mapper.map('<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
end

return lspmod
