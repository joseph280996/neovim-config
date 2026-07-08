return {
  "Mirsmog/real-icons.nvim",
  build = ":RealIconsInstallPack material",
  opts = {
    pack = "material",
    integrations = {
      snacks_picker = true,
      lualine = false,
      neo_tree = true,
    },
  },
}
