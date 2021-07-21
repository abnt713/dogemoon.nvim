local utils = {}

function utils.map(lhs, rhs, mode, opts)
  local map_mode = mode or 'n'
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(map_mode, lhs, rhs, options)
end

function utils.spacemap(lhs, rhs, mode, opts)
  utils.map('<space>' .. lhs, rhs, mode, opts)
end

function utils.leadermap(lhs, rhs, mode, opts)
  utils.map('<leader>' .. lhs, rhs, mode, opts)
end

function debug_highlight_group()
  local line = vim.fn.line(".")
  local col = vim.fn.col(".")
  local hi = vim.fn.synIDattr(vim.fn.synID(line, col, 1), "name")
  local trans = vim.fn.synIDattr(vim.fn.synID(line, col, 0), "name")
  local lo = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.synID(line, col, 1)), "name")

  print(string.format("[%s, %s] hi<%s> trans<%s> lo<%s>", line, col, hi, trans, lo))
end

function file_def()
  local file_reference = vim.fn.expand('%') .. ':' .. vim.fn.line('.')
  vim.fn.setreg('+', file_reference)
  print('"' .. file_reference .. '" copied to clipboard')
end

return utils
