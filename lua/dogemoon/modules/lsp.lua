local function load(plug)
  plug {'neovim/nvim-lspconfig'}
  plug {'nvim-lua/completion-nvim'}
  plug {'nvim-lua/lsp_extensions.nvim'}
  plug {'ojroques/nvim-lspfuzzy'}
  plug {'onsails/lspkind-nvim'}
end

local function gopls_config(ctx)
  if not ctx.project_config.go.has_tags() then return {} end

  tag_list = ctx.project_config.go.concat_tags(",")
  return {
    settings = {
      gopls = {
        buildFlags = {"-tags=" .. tag_list},
        env = {
          GOFLAGS = "-tags=" .. tag_list
        }
      }
    }
  }
end

local function intelephense_config(ctx)
  return {}
end

local function configure(ctx)
  local lspcfg = require 'lspconfig'
  local lspfuzzy = require 'lspfuzzy'

  lspcfg.gopls.setup(gopls_config(ctx))
  lspcfg.intelephense.setup(intelephense_config(ctx))

  lspfuzzy.setup({})

  vim.lsp.handlers["textDocument/publishDiagnostics"] = function()
  end

  require('lspkind').init({
    with_text = false,
  })

  ctx.map('ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
  ctx.map('gh', '<cmd>lua vim.lsp.buf.hover()<CR>')
  ctx.map('gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
  ctx.map('gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
  ctx.map('gr', '<cmd>lua vim.lsp.buf.references()<CR>')
  ctx.map('gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
  ctx.map('gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
  ctx.map('<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
  ctx.spacemap('ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
end

return {
  load = load,
  configure = configure,
}
