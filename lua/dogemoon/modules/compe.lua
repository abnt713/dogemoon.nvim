local compe = {}

function compe.load(plug)
  plug {'hrsh7th/nvim-compe'}
end

function compe.configure(mapper)
  compe.settings()
  compe.maps(mapper)
end

function compe.settings()
  local compe = require ('compe')
  compe.setup {
    enabled = true;
    autocomplete = true;
    debug = false;
    min_length = 1;
    preselect = 'enable';
    throttle_time = 80;
    source_timeout = 200;
    incomplete_delay = 400;
    max_abbr_width = 100;
    max_kind_width = 100;
    max_menu_width = 100;
    documentation = true;
    source = {
      path = true;
      buffer = true;
      calc = true;
      nvim_lsp = true;
      nvim_lua = true;
    };
  }

  local function replace_term_codes(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
  end

  local function is_backspace()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s')
  end

  _G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
      return replace_term_codes "<C-n>"
    end

    if is_backspace() then
      return replace_term_codes "<Tab>"
    end

    return vim.fn['compe#complete']()
  end

  _G.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
      return replace_term_codes "<C-p>"
    end 
    return replace_term_codes "<S-Tab>"
  end
end

function compe.maps(mapper)
  mapper.map('<C-Space>', 'compe#complete()', 'i', {expr = true, silent = true})
  mapper.map('<CR>', "compe#confirm('<CR>')", 'i', {expr = true, silent = true})
  mapper.map('<Tab>', 'v:lua.tab_complete()', 'i', {expr = true, noremap = false})
  mapper.map('<Tab>', 'v:lua.tab_complete()', 's', {expr = true, noremap = false})
  mapper.map('<S-Tab>', 'v:lua.s_tab_complete()', 'i', {expr = true, noremap = false})
  mapper.map('<S-Tab>', 'v:lua.s_tab_complete()', 's', {expr = true, noremap = false})
end

return compe
