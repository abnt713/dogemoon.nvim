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
  return function(projcfg)
    lspmod.setup(projcfg)
    lspmod.maps(mapper)
  end
end

function lspmod.setup(projcfg)
  local lspcfg = require 'lspconfig'
  local lspfuzzy = require 'lspfuzzy'

  if projcfg == nil then
    projcfg = lspmod.default_configs()
  end

  lspcfg.gopls.setup(projcfg.gopls)
  lspcfg.intelephense.setup({})
  lspcfg.pyls.setup({})
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


function lspmod.maps(mapper)
  mapper.map('ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
  mapper.map('gh', '<cmd>lua vim.lsp.buf.hover()<CR>')
  mapper.map('gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
  mapper.map('gr', '<cmd>lua vim.lsp.buf.references()<CR>')
  mapper.map('<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
end

return lspmod
