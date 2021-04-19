local earthsong = {}

local colorscheme = {
	-- Background
	base00 = '#292520',
	-- Current line background
	base01 = '#3e3b36',
	-- Visual selection
	base02 = '#3e3b36',
	-- Commentaries
	base03 = '#6c7891',
	-- Line numbers
	base04 = '#675f54',
	-- Autocomplete selection color
	base05 = '#abb2bf',
	-- No idea
	base06 = '#565c64',
	-- No Idea
	base07 = '#c5c8e6',
	-- Variables
	base08 = '#e5c6aa',
	-- Integers, bool
	base09 = '#1398b9',
	-- Types
	base0A = '#56b6c2',
	-- Strings and literals
	base0B = '#d0633d',
	-- Brackets
	base0C = '#56b6c2',
	-- Function names
	base0D = '#f5ae2e',
	-- Keywords
	base0E = '#f6f7ec',
	-- 
	base0F = '#56b6c2',
}

function earthsong.apply()
	require('base16-colorscheme').setup(colorscheme)
	vim.cmd('highlight NonText guifg=' .. colorscheme.base00)
	vim.cmd('highlight CustomIndentGuides guifg=' .. colorscheme.base06)
	vim.cmd('match CustomIndentGuides /\t/')
	vim.g.indentLine_defaultGroup = 'CustomIndentGuides'
end

return earthsong

-- normal:
--     black: "#121418"
--     red: "#c94234"
--     green: "#85c54c"
--     yellow: "#f5ae2e"
--     blue: "#1398b9"
--     purple: "#d0633d"
--     cyan: "#509552"
--     white: "#e5c6aa"
--   bright:
--     black: "#675f54"
--     red: "#ff645a"
--     green: "#98e036"
--     yellow: "#e0d561"
--     blue: "#5fdaff"
--     purple: "#ff9269"
--     cyan: "#84f088"
--     white: "#f6f7ec"
--   primary:
--     foreground: "#e5c7a9"
--     background: "#292520"
--   cursor:
--     cursor: "#e5c7a9"
