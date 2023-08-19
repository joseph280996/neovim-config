local tabnine_conf = {
  "tzachar/cmp-tabnine", -- Tabnine
}

local function get_cmp_packages()
  local os_name = vim.loop.os_uname().sysname
  if os_name == "Darwin" or os_name == "Linux" then
    tabnine_conf.build = "./install.sh"
  end

  if os_name == "Window_NT" then
    tabnine_conf.build = "pwsh ./install.ps1"
  end

  return tabnine_conf
end

return get_cmp_packages()
