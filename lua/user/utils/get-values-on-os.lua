local system_name = require("user.utils.os-name")

-- @tparam tab system_values
-- @tparam bool is_macOS_same_as_Linux
local function get_values_on_os(system_values, is_macOS_same_as_Linux)
  print()
  local os_name = vim.loop.os_uname().sysname

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

return {
  get_values_on_os = get_values_on_os,
}
