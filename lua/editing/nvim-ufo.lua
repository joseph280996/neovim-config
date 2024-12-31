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
    {
      "zr",
      "<cmd>lua require('ufo').openFoldsExceptKinds()<cr>",
      mode = "n",
      desc = "Open Folds Except Kinds",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "zm",
      "<cmd>lua require('ufo').closeFoldsWith()<cr>",
      mode = "n",
      desc = "Close Folds With",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "zR",
      "<cmd>lua require('ufo').openAllFolds()<cr>",
      mode = "n",
      desc = "Open All Folds",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "K",
      function()
        local winId = require("ufo").peekFoldedLinesUnderCursor()
        if not winId then
          vim.lsp.buf.hover()
        end
      end,
      mode = "n",
      desc = "Toggle Lsp Hover",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "zM",
      "<cmd>lua require('ufo').closeAllFolds()<cr>",
      mode = "n",
      desc = "Close All Folds",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
  },
}
