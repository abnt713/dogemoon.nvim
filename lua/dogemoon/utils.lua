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

return utils
