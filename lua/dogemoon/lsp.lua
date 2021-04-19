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
	local configfile = vim.fn.getcwd() .. '/nvim.local.json'
	if vim.fn.filereadable(configfile) == 0 then
		return default_configs()
	end

	local contents = vim.fn.readfile(configfile)
	return vim.fn.json_decode(contents)
end

function lsp.setup()
	local lspcfg = require 'lspconfig'
	local lspfuzzy = require 'lspfuzzy'

	local project_cfg = read_local_configs()

	lspcfg.gopls.setup(project_cfg.gopls)
	lspcfg.intelephense.setup({})
	lspfuzzy.setup{}

	vim.lsp.handlers["textDocument/publishDiagnostics"] = function()
	end

	vim.g.ale_lint_on_text_changed = 'never'
	vim.g.ale_lint_on_insert_leave = 0
	vim.g.ale_lint_on_enter = 0
end

function lsp.register_maps()
	utils.map('ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
	utils.map('gh', '<cmd>lua vim.lsp.buf.hover()<CR>')
	utils.map('gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
	utils.map('gr', '<cmd>lua vim.lsp.buf.references()<CR>')
	utils.map('<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
end

return lsp
