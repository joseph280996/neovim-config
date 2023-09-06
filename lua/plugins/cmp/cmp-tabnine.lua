local get_values_on_os = require("user.utils.get-values-on-os").get_values_on_os

local function get_packages_build_cmd()
  local os_command = {
    Window = "pwsh ./install.ps1",
    Linux = "./install.sh"
  }

  return get_values_on_os(os_command, true)
end

return {
  "tzachar/cmp-tabnine", -- Tabnine
  build = get_packages_build_cmd(),
}
