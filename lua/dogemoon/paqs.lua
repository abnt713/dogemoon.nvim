local paqs = {}

local spacemap = require('dogemoon.utils').spacemap

function paqs.setup()
	vim.cmd 'packadd paq-nvim'
	local paq = require('paq-nvim').paq

	paq {'savq/paq-nvim', opt=true}
	paq {'tjdevries/colorbuddy.nvim'}

	paq {'RRethy/nvim-base16'}
	paq {'maaslalani/nordbuddy'}

	paq {'itchyny/lightline.vim'}
	paq {'mengelbrecht/lightline-bufferline'}
	paq {'dense-analysis/ale'}
	paq {'editorconfig/editorconfig-vim'}
	paq {'hrsh7th/nvim-compe'}

	paq {'junegunn/fzf'}
	paq {'junegunn/fzf.vim'}
	paq {'mattn/vim-goimports'}

	paq {'neovim/nvim-lspconfig'}
	paq {'nvim-lua/completion-nvim'}
	paq {'nvim-lua/lsp_extensions.nvim'}
	paq {'ojroques/nvim-lspfuzzy'}

	paq {'preservim/nerdtree'}
	paq {'ryanoasis/vim-devicons'}

	paq {'airblade/vim-gitgutter'}
	paq {'tpope/vim-fugitive'}

	paq {'tpope/vim-commentary'}
	paq {'chrisbra/colorizer'}
	paq {'christoomey/vim-tmux-navigator'}
	paq {'Yggdroot/indentLine'}

	paq {
		'nvim-treesitter/nvim-treesitter', 
		run=function()
			vim.cmd('TSUpdate')
		end
	}
	paq {'nvim-treesitter/playground'}

	configure_plugins()
end

local function configure_lightline()
	vim.g.lightline = {
		colorscheme = 'seoul256',
		active = {
			left = {{'mode', 'paste'}, {'readonly', 'filename', 'modified'}}
		},
		tabline = {
			left = {{'buffers'}},
			right = {{'close'}}
		},
		component_expand = {
			buffers = 'lightline#bufferline#buffers'
		},
		component_type = {
			buffers = 'tabsel'
		}
	}
end

local function configure_treesitter()
	require 'nvim-treesitter.configs'.setup({
		highlight = { enable = true },
		indent = {
			enable = true
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
end

local function configure_colors()
	require('dogemoon/earthsong').apply()
	-- require('colorbuddy').colorscheme('nordbuddy')
end

function configure_plugins()
	-- vim.g.EditorConfig_core_mode = 'external_command'
	-- vim.g.EditorConfig_exec_path = "/usr/bin/editorconfig"
	configure_lightline()
	configure_treesitter()
	configure_colors()
end

function paqs.register_maps()
	spacemap('pu', '<cmd>PaqUpdate<CR>')
	spacemap('pc', '<cmd>PaqClean<CR>')
	spacemap('pi', '<cmd>PaqInstall<CR>')

	spacemap('cc', '<cmd>ColorToggle<CR>')
end

return paqs
