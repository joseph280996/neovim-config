local core_packages = {
  -- Code Completion
  "hrsh7th/nvim-cmp", -- Completion Plugin
  "hrsh7th/cmp-buffer", -- Buffer Completion
  "hrsh7th/cmp-path", -- Path Completion
  "hrsh7th/cmp-cmdline", -- CMD Completion
  "saadparwaiz1/cmp_luasnip", -- Snippet Completion
  "hrsh7th/cmp-nvim-lsp", -- Buffer Completion
}

local tabnine_package = {
  "tzachar/cmp-tabnine", -- Tabnine
  build = "pwsh ./install.ps1",
  dependencies = "hrsh7th/nvim-cmp",
}

local function get_packages_setup()
  local packages = core_packages
  if vim.loop.os_uname().sysname == "Window_NT" then
    vim.tbl_extend("keep", core_packages, tabnine_package)
  end

  return packages
end


return get_packages_setup()
