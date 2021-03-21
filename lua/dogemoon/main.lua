local main = {}

function main.run()
	local general = require('dogemoon.general')
	local lsp = require('dogemoon.lsp')
	local paqs = require('dogemoon.paqs')
	local autocompl = require('dogemoon.autocompl')

	general.setup()
	paqs.setup()
	lsp.setup()
	autocompl.setup()

	autocompl.register_maps()
	general.register_maps()
	lsp.register_maps()
	paqs.register_maps()
end

return main
