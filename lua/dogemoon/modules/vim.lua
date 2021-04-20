local vimmod = {}

function vimmod.load(plug)
  return nil
end

function vimmod.configure(mapper)
  return function()
    if (vim.fn.exists('+termguicolors')) then
      vim.o['t_8f'] = '\\<Esc>[38;2;%lu;%lu;%lum'
      vim.o['t_8b'] = '\\<Esc>[48;2;%lu;%lu;%lum'
      vim.o['termguicolors'] = true
    end

    vim.o.completeopt = 'menuone,noselect'
    vim.o.foldlevelstart = 90
    vim.o.hidden = true
    vim.o.background = 'dark'
    vim.o.shortmess = vim.o.shortmess .. "c"
    vim.o.showtabline = 2
    vim.wo.number = true
    vim.wo.relativenumber = true
    vim.wo.signcolumn = 'yes'

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
end

function vimmod.maps(mapper)
  mapper.spacemap('w', '<cmd>bd<CR>')
  mapper.spacemap('h', '<cmd>bp<CR>')
  mapper.spacemap('l', '<cmd>bn<CR>')

  mapper.spacemap('fe', '<cmd>Explore<CR>')

  mapper.spacemap('nt', '<cmd>set norelativenumber!<CR>')

  mapper.map('<C-c>', '<ESC>', 'i')
  mapper.map('<leader>y', '"+y', '')
  mapper.map('<leader>p', '"+p', '')

  mapper.spacemap('tt', '<cmd>tabnew<CR>')
  mapper.spacemap('tl', '<cmd>tabn<CR>')
  mapper.spacemap('th', '<cmd>tabp<CR>')
  mapper.spacemap('tw', '<cmd>tabclose<CR>')
end

return vimmod
