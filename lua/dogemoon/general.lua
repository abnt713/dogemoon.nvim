local spacemap = require('dogemoon.utils').spacemap
local map = require('dogemoon.utils').map

local function adapt_termguicolors()
	if (vim.fn.exists('+termguicolors')) then
		vim.o['t_8f'] = '\\<Esc>[38;2;%lu;%lu;%lum'
		vim.o['t_8b'] = '\\<Esc>[48;2;%lu;%lu;%lum'
		vim.o['termguicolors'] = true
	end
end

local function set_options()
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
end

local function register_buffer_maps()
	spacemap('b', '<cmd>Buffers<CR>')
	spacemap('w', '<cmd>bd<CR>')
	spacemap('h', '<cmd>bp<CR>')
	spacemap('l', '<cmd>bn<CR>')
end

local function register_file_maps()
	spacemap('ff', '<cmd>Files<CR>')
	spacemap('fs', '<cmd>Ag<CR>')
	spacemap('fe', '<cmd>Explore<CR>')
	spacemap('ft', '<cmd>NERDTreeToggle<CR>')
end

local function register_git_maps()
	spacemap('gs', '<cmd>Git<CR>')
	spacemap('gc', '<cmd>Git commit<CR>')
	spacemap('gb', '<cmd>Git blame<CR>')
	spacemap('gf', '<cmd>GFiles?<CR>')
end

local function register_number_maps()
	spacemap('nt', '<cmd>set norelativenumber!<CR>')
end

local function register_util_maps()
	map('<C-c>', '<ESC>', 'i')
	map('<leader>y', '"+y', '')
	map('<leader>p', '"+p', '')
end

local function register_tab_maps()
	spacemap('tt', '<cmd>tabnew<CR>')
	spacemap('tl', '<cmd>tabn<CR>')
	spacemap('th', '<cmd>tabp<CR>')
	spacemap('tw', '<cmd>tabclose<CR>')
end

local function register_line_maps()
	spacemap('ll', '<cmd>set rnu!<CR>')
end

local general = {}

function general.setup()
	adapt_termguicolors()
	set_options()
end

function general.register_maps()
	register_util_maps()
	register_buffer_maps()
	register_file_maps()
	register_git_maps()
	register_number_maps()
	register_tab_maps()
	register_line_maps()
end

return general
