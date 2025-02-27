local system_name = require("utils.constants").os_name

--- Determine OS to use appropriate value
---@param system_values {Window: any, Linux: any, MacOS: any} An Object of different values to use for each OS
---@param is_macOS_same_as_Linux boolean? A flag to use the same value for both Mac and Linux
local function get_values_on_os(system_values, is_macOS_same_as_Linux)
  local os_name = (vim.loop or vim.uv).os_uname().sysname

  if os_name == system_name.Window then
    return system_values.Window
  end

  if is_macOS_same_as_Linux then
    if os_name == system_name.Linux or os_name == system_name.MacOS then
      return system_values.Linux or system_values.MacOS
    end
  else
    if os_name == system_name.Linux then
      return system_values.Linux
    end
    if os_name == system_name.MacOS then
      return system_values.MacOS
    end
  end
end

return get_values_on_os
