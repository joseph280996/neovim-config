local KEYBINDING_OPTS = require("utils.constants").KEYBINDING_OPTS

return {
  "TheNoeTrevino/haunt.nvim",
  -- default config: change to your liking, or remove it to use defaults
  ---@class HauntConfig
  opts = {
    sign = "󱙝",
    sign_hl = "DiagnosticInfo",
    virt_text_hl = "HauntAnnotation", -- links to DiagnosticVirtualTextHint
    annotation_prefix = " 󰆉 ",
    annotation_suffix = "",
    line_hl = nil,
    virt_text_pos = "eol",
    above_max_width = 80,
    above_border = "rounded", -- "single", "double", "none", or character array
    data_dir = nil,
    per_branch_bookmarks = true,
    picker = "auto", -- "auto", "snacks", "telescope", or "fzf"
    picker_keys = {
      delete = { key = "d", mode = { "n" } },
      edit_annotation = { key = "a", mode = { "n" } },
    },
  },
  keys = {
    -- annotations
    vim.tbl_deep_extend("force", {
      "<leader>ha",
      function()
        require("haunt.api").annotate()
      end,
      desc = "Annotate",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<leader>ht",
      function()
        require("haunt.api").toggle_annotation()
      end,
      desc = "Toggle Annotation",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<leader>hT",
      function()
        require("haunt.api").toggle_all_lines()
      end,
      desc = "Toggle All Annotations",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<leader>hd",
      function()
        require("haunt.api").delete()
      end,
      desc = "Delete Bookmark",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<leader>hC",
      function()
        require("haunt.api").clear_all()
      end,
      desc = "Delete All Bookmarks",
    }, KEYBINDING_OPTS),

    -- move
    vim.tbl_deep_extend("force", {
      "<leader>hp",
      function()
        require("haunt.api").prev()
      end,
      desc = "Previous Bookmark",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<leader>hn",
      function()
        require("haunt.api").next()
      end,
      desc = "Next Bookmark",
    }, KEYBINDING_OPTS),

    -- picker
    vim.tbl_deep_extend("force", {
      "<leader>hl",
      function()
        require("haunt.picker").show()
      end,
      desc = "Show Picker",
    }, KEYBINDING_OPTS),

    -- quickfix
    vim.tbl_deep_extend("force", {
      "<leader>hq",
      function()
        require("haunt.api").to_quickfix()
      end,
      desc = "Send Hauntings to QF List (all)",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<leader>hQ",
      function()
        require("haunt.api").to_quickfix({ current_buffer = true })
      end,
      desc = "Send Hauntings to QF List (buffer)",
    }, KEYBINDING_OPTS),

    -- yank
    vim.tbl_deep_extend("force", {
      "<leader>hy",
      function()
        require("haunt.api").yank_locations({ current_buffer = true })
      end,
      desc = "Send Hauntings to Clipboard (buffer)",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<leader>hY",
      function()
        require("haunt.api").yank_locations()
      end,
      desc = "Send Hauntings to Clipboard (all)",
    }, KEYBINDING_OPTS),
  },
}
