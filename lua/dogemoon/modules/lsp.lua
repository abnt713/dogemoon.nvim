local lspmod = {}

function lspmod.load(plug)
  plug {'neovim/nvim-lspconfig'}
  plug {'nvim-lua/completion-nvim'}
  plug {'nvim-lua/lsp_extensions.nvim'}
  plug {'ojroques/nvim-lspfuzzy'}
  plug {'onsails/lspkind-nvim'}
end

function lspmod.configure(mapper, projcfg)
  lspmod.setup(projcfg)
  lspmod.kind()
  lspmod.maps(mapper)
end

function lspmod.kind()
  require('lspkind').init({
    with_text = false,
  })
end

function lspmod.setup(projcfg)
  local lspcfg = require 'lspconfig'
  local lspfuzzy = require 'lspfuzzy'

  lspcfg.gopls.setup(projcfg.gopls)
  lspcfg.intelephense.setup(projcfg.intelephense)
  -- lspcfg.pyls.setup(projcfg.pyls)
  lspfuzzy.setup({})

  vim.lsp.handlers["textDocument/publishDiagnostics"] = function()
  end
end

function lspmod.config_schema()
  return "lsp", {
    gopls = {},
    intelephense = {},
    pyls = {},
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
