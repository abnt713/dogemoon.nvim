local vimmod = {}

function vimmod.configure(mapper)
  if (vim.fn.exists('+termguicolors')) then
    vim.o['termguicolors'] = true
  end

  vim.o.completeopt = 'menuone,noselect'
  vim.o.foldlevelstart = 90
  vim.o.hidden = true
  vim.o.shortmess = vim.o.shortmess .. "c"
  vim.o.showtabline = 1
  vim.o.updatetime = 1000
  vim.wo.number = true
  vim.wo.relativenumber = true
  vim.wo.signcolumn = 'yes'
  vim.wo.colorcolumn = '80'

  local indent_size = 4
  vim.bo.shiftwidth = indent_size
  vim.bo.smartindent = true
  vim.bo.tabstop = indent_size
  vim.bo.softtabstop = indent_size

  vim.g.netrw_banner = 0
  vim.g.netrw_liststyle = 3

  vim.cmd('set list lcs=tab:\\¦\\ ')
  vimmod.maps(mapper)
end

function vimmod.maps(mapper)
  -- {
  --  {'w', 'bd', cmd=true, prefix=true, modes='i'}
  -- }
  mapper.spacemap('w', '<cmd>bd<CR>')

  mapper.spacemap('fe', '<cmd>Explore<CR>')
  mapper.spacemap('fr', '<cmd>lua file_def()<CR>')

  mapper.spacemap('nt', '<cmd>set norelativenumber!<CR>')

  mapper.map('<C-c>', '<ESC>', 'i')
  mapper.map('<leader>y', '"+y', '')
  mapper.map('<leader>p', '"+p', '')

  mapper.spacemap('tt', '<cmd>tabnew<CR>')
  mapper.spacemap('tj', '<cmd>tabn<CR>')
  mapper.spacemap('tk', '<cmd>tabp<CR>')
  mapper.spacemap('tw', '<cmd>tabclose<CR>')

  mapper.map('<C-space>', 'if err != nil {}', 'i')
end

return vimmod
