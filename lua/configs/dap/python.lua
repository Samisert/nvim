local dap = require("dap")

dap.adapters.python = function(cb, config)
  if config.request == "attach" then
    ---@diagnostic disable-next-line: undefined-field
    local port = (config.connect or config).port
    ---@diagnostic disable-next-line: undefined-field
    local host = (config.connect or config).host or "127.0.0.1"
    cb({
      type = "server",
      port = assert(port, "`connect.port` is required for a python `attach` configuration"),
      host = host,
      options = {
        source_filetype = "python",
      },
    })
  else
    cb({
      type = "executable",
      -- using in Windows
      -- command = "C:\\Users\\93583\\AppData\\Local\\nvim-data\\mason\\packages\\debugpy\\venv\\Scripts\\python",
      -- using in Linux
      command = "/usr/bin/python"
      args = { "-m", "debugpy.adapter" },
      options = {
        source_filetype = "python",
      },
    })
  end
end

local prev_function_node = nil
local prev_function_name = ""

-- < Retrieve the name of the function the cursor is in.
function _G.function_surrounding_cursor()
  local ts_utils = require("nvim-treesitter.ts_utils")
  local current_node = ts_utils.get_node_at_cursor()

  if not current_node then
    return ""
  end

  local func = current_node

  while func do
    if func:type() == "function_definition" or func:type() == "function_declaration" then
      break
    end

    func = func:parent()
  end

  if not func then
    prev_function_node = nil
    prev_function_name = ""
    return ""
  end

  if func == prev_function_node then
    return prev_function_name
  end

  prev_function_node = func

  local find_name
  find_name = function(node)
    for i = 0, node:named_child_count() - 1, 1 do
      local child = node:named_child(i)
      local type = child:type()

      if type == "identifier" or type == "operator_name" then
        return (ts_utils.get_node_text(child))[1]
      else
        local name = find_name(child)

        if name then
          return name
        end
      end
    end

    return nil
  end

  prev_function_name = find_name(func)
  return prev_function_name
end

local prev_class_node = nil
local prev_class_name = ""

function _G.class_surrounding_cursor()
  local ts_utils = require("nvim-treesitter.ts_utils")
  local current_node = ts_utils.get_node_at_cursor()

  if not current_node then
    return ""
  end

  local func = current_node

  while func do
    if func:type() == "class_definition" or func:type() == "class_declaration" then
      break
    end

    func = func:parent()
  end

  if not func then
    prev_class_node = nil
    prev_class_name = ""
    return ""
  end

  if func == prev_class_node then
    return prev_class_name
  end

  prev_class_node = func

  local find_name
  find_name = function(node)
    for i = 0, node:named_child_count() - 1, 1 do
      local child = node:named_child(i)
      local type = child:type()

      if type == "identifier" or type == "operator_name" then
        return (ts_utils.get_node_text(child))[1]
      else
        local name = find_name(child)

        if name then
          return name
        end
      end
    end

    return nil
  end

  prev_class_name = find_name(func)
  return prev_class_name
end

dap.set_log_level("TRACE")

local function get_module_path()
  return vim.fn.expand("%:.:r:gs?/?.?")
end
local function prune_nil(items)
  return vim.tbl_filter(function(x)
    return x
  end, items)
end

local function log_to_file()
  -- https://github.com/microsoft/debugpy/wiki/Enable-debugger-logs
  vim.env.DEBUGPY_LOG_DIR = vim.fn.stdpath("cache") .. "/debugpy"
  return true
end
dap.configurations.python = {
  {
    type = "python",
    request = "launch",
    name = "Launch file",
    program = "${file}",
    pythonPath = function()
      -- using in Windows
      -- return "C:\\Users\\93583\\AppData\\Local\\nvim-data\\mason\\packages\\debugpy\\venv\\Scripts\\python"
      -- using in Linux
      return "/usr/bin/python"
    end,
  },
  {
    type = "python",
    request = "attach",
    name = "Attach remote",
    connect = function()
      local host = vim.fn.input("Host [127.0.0.1]: ")
      host = host ~= "" and host or "127.0.0.1"
      local port = tonumber(vim.fn.input("Port [5678]: ")) or 5678
      return { host = host, port = port }
    end,
  },
  {
    type = "python",
    request = "launch",
    name = "Debug test function",
    module = "unittest",
    args = function()
      local path = get_module_path()
      local classname = class_surrounding_cursor()
      local function_name = function_surrounding_cursor()
      local test_path = table.concat(prune_nil({ path, classname, function_name }), ".")
      return {
        "-v",
        test_path,
      }
    end,
    console = "integratedTerminal",
    justMyCode = false,
    logToFile = log_to_file,
    pythonPath = function()
      -- using in Windows
      -- return "C:\\Users\\93583\\AppData\\Local\\.virtualenvs\\debugpy\\Scripts\\python"
      -- using in Linux
      return "/usr/bin/python"
    end,
  },
}
