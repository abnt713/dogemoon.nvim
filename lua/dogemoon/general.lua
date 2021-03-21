local spacemap = require('dogemoon.utils').spacemap


local function adapt_termguicolors()
	if (vim.fn.exists('+termguicolors')) then
		vim.o['t_8f'] = '\\<Esc>[38;2;%lu;%lu;%lum'
		vim.o['t_8b'] = '\\<Esc>[48;2;%lu;%lu;%lum'
		vim.o['termguicolors'] = true
	end
end

local function set_options(colorscheme)
	local indent_size = 4
	vim.cmd('colorscheme ' .. colorscheme)
	vim.o.completeopt = 'menuone,noselect'
	vim.o.foldlevelstart = 90
	vim.o.hidden = true
	vim.o.background = 'dark'
	vim.o.shortmess = vim.o.shortmess .. "c"
	vim.wo.number = true
	vim.wo.relativenumber = true
	vim.wo.signcolumn = 'yes'
	vim.bo.shiftwidth = indent_size
	vim.bo.smartindent = true
	vim.bo.tabstop = indent_size
	vim.bo.softtabstop = indent_size

	vim.g.netrw_banner = 0
	vim.g.netrw_liststyle = 3
end

local function register_buffer_maps()
	spacemap('bb', '<cmd>Buffers<CR>')
	spacemap('bw', '<cmd>bd<CR>')
	spacemap('bn', '<cmd>bn<CR>')
	spacemap('bp', '<cmd>bp<CR>')
end

local function register_file_maps()
	spacemap('ff', '<cmd>Files<CR>')
	spacemap('fs', '<cmd>Ag<CR>')
	spacemap('fe', '<cmd>Explore<CR>')
	spacemap('ft', '<cmd>NERDTreeToggle<CR>')
end

local function register_git_maps()
	spacemap('gs', '<cmd>Gstatus<CR>')
	spacemap('gc', '<cmd>Git commit<CR>')
	spacemap('gf', '<cmd>GFiles?<CR>')
end

local function register_number_maps()
	spacemap('nt', '<cmd>set norelativenumber!<CR>')
end

local function register_tab_maps()
	spacemap('tt', '<cmd>tabnew<CR>')
	spacemap('tn', '<cmd>tabn<CR>')
	spacemap('tp', '<cmd>tabp<CR>')
	spacemap('tw', '<cmd>tabclose<CR>')
end

local general = {}

function general.setup()
	adapt_termguicolors()
	set_options('badwolf')
end

function general.register_maps()
	register_buffer_maps()
	register_file_maps()
	register_git_maps()
	register_number_maps()
	register_tab_maps()
end

return general
