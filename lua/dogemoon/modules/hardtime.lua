local M = {}

function M.load(plug)
  plug {'takac/vim-hardtime'}
end

function M.configure()
  vim.g.hardtime_default_on = 1
  vim.g.hardtime_ignore_buffer_patterns = {"NERD.*"}
end

return M
