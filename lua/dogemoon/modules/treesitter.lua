local treesittermod = {}

function treesittermod.load(plug)
  plug {
    'nvim-treesitter/nvim-treesitter', 
    run=function()
      vim.cmd 'TSUpdate'
    end
  }
  plug {'nvim-treesitter/playground'}
  plug {'nvim-treesitter/nvim-treesitter-refactor'}
end

function enable_folding()
  vim.wo.foldmethod = 'expr'
  vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
end

function treesittermod.configure(ctx)
  require 'nvim-treesitter.configs'.setup({
    highlight = { enable = true },
    indent = {
      enable = false
    },
    refactor = {
      highlight_definitions = { enable = false }
    },
    playground = {
      enable = true,
      disable = {},
      updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
      persist_queries = false, -- Whether the query persists across vim sessions
      keybindings = {
        toggle_query_editor = 'o',
        toggle_hl_groups = 'i',
        toggle_injected_languages = 't',
        toggle_anonymous_nodes = 'a',
        toggle_language_display = 'I',
        focus_language = 'f',
        unfocus_language = 'F',
        update = 'R',
        goto_node = '<cr>',
        show_help = '?',
      },
    }
  })

  ctx.spacemap('ze', '<cmd>lua enable_folding()<CR>')
end


return treesittermod
