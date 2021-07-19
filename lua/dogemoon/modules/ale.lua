local ale = {}

function ale.load(plug)
  plug {'dense-analysis/ale'}
end

function ale.configure()
  vim.g.ale_linters = {go = {'revive', 'gopls', 'gofmt'}}
  vim.g.ale_lint_on_text_changed = 'never'
  vim.g.ale_lint_on_insert_leave = 0
  vim.g.ale_lint_on_enter = 0
end

return ale
