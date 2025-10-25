local constants = require("utils.constants")

--- Determine OS to use appropriate value
---@param system_values {["Window_NT"]: any, Linux: any, Darwin: any} An Object of different values to use for each OS
---@param is_macOS_same_as_Linux boolean? A flag to use the same value for both Mac and Linux
local function get_values_on_os(system_values, is_macOS_same_as_Linux)
---@diagnostic disable-next-line: undefined-field
  local os_name = vim.uv.os_uname().sysname

  if is_macOS_same_as_Linux and os_name == constants.DARWIN then
    os_name = constants.LINUX
  end

  return system_values[os_name]
end

return get_values_on_os
