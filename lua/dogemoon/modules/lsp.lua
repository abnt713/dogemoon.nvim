local function load(plug)
  plug {'neovim/nvim-lspconfig'}
  plug {'nvim-lua/completion-nvim'}
  plug {'nvim-lua/lsp_extensions.nvim'}
  plug {'ojroques/nvim-lspfuzzy'}
  plug {'onsails/lspkind-nvim'}
end

local function configure_go_project(ctx, lspcfg)
  tag_list = ctx.project_config.go.concat_tags(",")
  gopls = {
    settings = {
      gopls = {
        buildFlags = {"-tags=" .. tag_list},
        env = {
          GOFLAGS = "-tags=" .. tag_list
        }
      }
    }
  }
  lspcfg.gopls.setup(gopls)
end

local function configure(ctx)
  local lspcfg = require 'lspconfig'
  local lspfuzzy = require 'lspfuzzy'

  if ctx.project_config.get_type() == "go" then
    configure_go_project(ctx, lspcfg)
  end

  if ctx.project_config.get_type() == "php" then
    lspcfg.intelephense.setup({})
  end

  lspfuzzy.setup({})

  vim.lsp.handlers["textDocument/publishDiagnostics"] = function()
  end

  require('lspkind').init({
    with_text = false,
  })

  ctx.map('ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
  ctx.map('gh', '<cmd>lua vim.lsp.buf.hover()<CR>')
  ctx.map('gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
  ctx.map('gr', '<cmd>lua vim.lsp.buf.references()<CR>')
  ctx.map('<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
end

return {
  load = load,
  configure = configure,
}
