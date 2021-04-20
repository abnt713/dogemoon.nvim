local main = require('dogemoon.doge')

function debug_highlight_group()
  local line = vim.fn.line(".")
  local col = vim.fn.col(".")
  local hi = vim.fn.synIDattr(vim.fn.synID(line, col, 1), "name")
  local trans = vim.fn.synIDattr(vim.fn.synID(line, col, 0), "name")
  local lo = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.synID(line, col, 1)), "name")

  print(string.format("[%s, %s] hi<%s> trans<%s> lo<%s>", line, col, hi, trans, lo))
end

main.run()
