local paqs = {}

local spacemap = require('dogemoon.utils').spacemap

function paqs.setup()
	vim.cmd 'packadd paq-nvim'
	local paq = require('paq-nvim').paq

	paq {'airblade/vim-gitgutter'}
	paq {'christoomey/vim-tmux-navigator'}
	paq {'editorconfig/editorconfig-vim'}
	paq {'hrsh7th/nvim-compe'}
	paq {'itchyny/lightline.vim'}
	paq {'junegunn/fzf'}
	paq {'junegunn/fzf.vim'}
	paq {'mattn/vim-goimports'}
	paq {'neovim/nvim-lspconfig'}
	paq {'nvim-lua/completion-nvim'}
	paq {'nvim-lua/lsp_extensions.nvim'}
	paq {'ojroques/nvim-lspfuzzy'}
	paq {'preservim/nerdtree'}
	paq {'ryanoasis/vim-devicons'}
	paq {'savq/paq-nvim', opt=true}
	paq {'sjl/badwolf'}
	paq {'takac/vim-hardtime'}
	paq {'tpope/vim-fugitive'}
	paq {'tpope/vim-commentary'}
end

function paqs.register_maps()
	spacemap('pu', '<cmd>PaqUpdate<CR>')
	spacemap('pc', '<cmd>PaqClean<CR>')
	spacemap('pi', '<cmd>PaqInstall<CR>')
end

return paqs
