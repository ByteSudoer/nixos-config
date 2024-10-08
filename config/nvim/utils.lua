_G.dump = function(...)
  print(vim.inspect(...))
end

_G.prequire = function(...)
  local status, lib = pcall(require, ...)
  if status then
    return lib
  end
  return nil
end

local M = {}

-- Used to alias Lua functions to user-defined Vim commands.
-- Example:
--   alias("foo", "Bar") allows you to invoke the Lua function "foo"
--   by calling :Bar in command mode
--
-- Example with args:
--   Say "foo" has the following signature: function foo(arg1, arg2) ... end
--   alias("foo", "Bar", { args = true }) will allow you to
--   invoke "foo" with arguments by calling `:Bar hello world` in command mode.
function M.alias(func, alias, options)
  local opts = { args = false }

  if options then
    opts = vim.tbl_extend("force", opts, options)
  end

  if not opts.args then
    vim.cmd(string.format("command! %s lua %s()", alias, func))
    return
  end

  local tmpl = "command! -nargs=1 %s lua %s(make_arg_tbl(<q-args>))"
  local stmt = string.format(tmpl, alias, func)
  vim.cmd(stmt)
end

-- Helper function used to convert whitespace separated arguments from VimScript
-- into a table that gets unpacked as arguments for a Lua defined function.
function M.make_arg_tbl(args)
  local result = {}
  local i = 1
  for arg in vim.gsplit(args, " ", false) do
    result[i] = arg
    i = i + 1
  end

  return unpack(result)
end

function M.check_back_space()
  local col = vim.fn.col(".") - 1
  if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
    return true
  else
    return false
  end
end

function M.warn(msg, name)
  vim.notify(msg, vim.log.levels.WARN, { title = name })
end

function M.error(msg, name)
  vim.notify(msg, vim.log.levels.ERROR, { title = name })
end

function M.info(msg, name)
  vim.notify(msg, vim.log.levels.INFO, { title = name })
end

function M.winsize()
  return unpack({
    vim.api.nvim_win_get_width(0),
    vim.api.nvim_win_get_height(0),
  })
end

return M

