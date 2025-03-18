local KEYBINDING_OPTS = require("utils.constants").KEYBINDING_OPTS

local virt_handler = function(virtText, lnum, endLnum, width, truncate)
  local newVirtText = {}
  local suffix = (" 󰁂 %d "):format(endLnum - lnum)
  local sufWidth = vim.fn.strdisplaywidth(suffix)
  local targetWidth = width - sufWidth
  local curWidth = 0
  for _, chunk in ipairs(virtText) do
    local chunkText = chunk[1]
    local chunkWidth = vim.fn.strdisplaywidth(chunkText)
    if targetWidth > curWidth + chunkWidth then
      table.insert(newVirtText, chunk)
    else
      chunkText = truncate(chunkText, targetWidth - curWidth)
      local hlGroup = chunk[2]
      table.insert(newVirtText, { chunkText, hlGroup })
      chunkWidth = vim.fn.strdisplaywidth(chunkText)
      -- str width returned from truncate() may less than 2nd argument, need padding
      if curWidth + chunkWidth < targetWidth then
        suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
      end
      break
    end
    curWidth = curWidth + chunkWidth
  end
  table.insert(newVirtText, { suffix, "MoreMsg" })
  return newVirtText
end

return {
  "kevinhwang91/nvim-ufo",
  dependencies = {
    "kevinhwang91/promise-async",
    "neovim/nvim-lspconfig", -- Native LSP
  },
  event = "BufReadPost",
  opts = {
    close_fold_kinds_for_ft = {
      cs = {
        "imports",
        "region",
      },
      default = { "imports" },
    },
    fold_virt_text_handler = virt_handler,
  },
  config = function(_, opts)
    require("ufo").setup(opts)
  end,
  keys = {
    vim.tbl_deep_extend("force", {
      "zr",
      "<cmd>lua require('ufo').openFoldsExceptKinds()<cr>",
      desc = "Open Folds Except Kinds",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "zm",
      "<cmd>lua require('ufo').closeFoldsWith()<cr>",
      desc = "Close Folds With",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "zR",
      "<cmd>lua require('ufo').openAllFolds()<cr>",
      desc = "Open All Folds",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "K",
      function()
        local winId = require("ufo").peekFoldedLinesUnderCursor()
        if not winId then
          vim.lsp.buf.hover()
        end
      end,
      desc = "Toggle Lsp Hover",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "zM",
      "<cmd>lua require('ufo').closeAllFolds()<cr>",
      desc = "Close All Folds",
    }, KEYBINDING_OPTS),
  },
}
