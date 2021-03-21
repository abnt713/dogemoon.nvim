local utils = require 'dogemoon.utils'

local lsp = {}

function gopls_setup()
end

function default_configs()
	return {
		gopls = {}
	}
end

function read_local_configs() 
	local configfile = vim.fn.getcwd() .. '/nvim.json'
	if vim.fn.filereadable(configfile) == 0 then
		return default_configs()
	end

	return dofile(configfile)
end

function lsp.setup()
	local lspcfg = require 'lspconfig'
	local lspfuzzy = require 'lspfuzzy'
	
	local project_cfg = read_local_configs()

	lspcfg.gopls.setup(project_cfg.gopls)
	lspfuzzy.setup{}
end

function lsp.register_maps()
	utils.map('ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
	utils.map('gh', '<cmd>lua vim.lsp.buf.hover()<CR>')
	utils.map('gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
	utils.map('gr', '<cmd>lua vim.lsp.buf.references()<CR>')
	utils.map('<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
end

return lsp
