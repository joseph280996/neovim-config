local opts = { noremap = true, silent = true }
local function get_bindings(filetype)
  local common_keymap = {
    {
      mode = "n",
      lhs = "gD",
      rhs = "<cmd>lua vim.lsp.buf.declaration()<CR>",
      opts = { desc = "Go to Declaration" },
    },
    {
      mode = "n",
      lhs = "gl",
      rhs = "<cmd>lua vim.diagnostic.open_float()<CR>",
      opts = { desc = "Open Diagnostic Float" },
    },
    {
      mode = "n",
      lhs = "<leader>li",
      rhs = "<cmd>LspInfo<cr>",
      opts = { desc = "Open LSP Info" },
    },
    {
      mode = "n",
      lhs = "<leader>lI",
      rhs = "<cmd>LspInstallInfo<cr>",
      opts = { desc = "Open LSP Install Info" },
    },
    {
      mode = "n",
      lhs = "<leader>lca",
      rhs = "<cmd>lua vim.lsp.buf.code_action()<cr>",
      opts = { desc = "Open Code Action" },
    },
    {
      mode = "n",
      lhs = "<leader>lj",
      rhs = "<cmd>lua vim.diagnostic.goto_next()<cr>",
      opts = { desc = "Next Diagnostic" },
    },
    {
      mode = "n",
      lhs = "<leader>lk",
      rhs = "<cmd>lua vim.diagnostic.goto_prev()<cr>",
      opts = { desc = "Prev Diagnostic" },
    },
    {
      mode = "n",
      lhs = "<leader>lr",
      rhs = "<cmd>lua vim.lsp.buf.rename()<cr>",
      opts = { desc = "Rename Symbol" },
    },
    {
      mode = "n",
      lhs = "<leader>ls",
      rhs = "<cmd>lua vim.lsp.buf.signature_help()<CR>",
      opts = { desc = "Display func signature" },
    },
    {
      mode = "n",
      lhs = "<leader>lq",
      rhs = "<cmd>lua vim.diagnostic.setloclist()<CR>",
      opts = { desc = "Quick Fix" },
    },
    {
      mode = "n",
      lhs = "<leader>lff",
      rhs = "<cmd>Format<cr>",
      opts = { desc = "File Format" },
    },
  }

  local ft_keymap = {
    {
      mode = "n",
      lhs = "gd",
      rhs = "<cmd>lua vim.lsp.buf.definition()<CR>",
      opts = { desc = "Go To Definition" },
    },
    {
      mode = "n",
      lhs = "gI",
      rhs = "<cmd>lua vim.lsp.buf.implementation()<CR>",
      opts = { desc = "Go To Implementation" },
    },
    {
      mode = "n",
      lhs = "gr",
      rhs = "<cmd>lua vim.lsp.buf.references()<CR>",
      opts = { desc = "Go To References" },
    },
  }

  if filetype == "cs" then
    ft_keymap = {
      {
        mode = "n",
        lhs = "gd",
        rhs = "<cmd>lua require('omnisharp_extended').lsp_definition()<CR>",
        opts = { desc = "Go To Definition" },
      },
      {
        mode = "n",
        lhs = "gI",
        rhs = "<cmd>lua require('omnisharp_extended').lsp_implementation()<CR>",
        opts = { desc = "Go To Implementation" },
      },
      {
        mode = "n",
        lhs = "gr",
        rhs = "<cmd>lua require('omnisharp_extended').lsp_references()<CR>",
        opts = { desc = "Go To References" },
      },
      {
        mode = "n",
        lhs = "gT",
        rhs = "<cmd>lua require('omnisharp_extended').lsp_type_definition()<CR>",
        opts = { desc = "Go To References" },
      },
      {
        mode = "n",
        lhs = "gd",
        rhs = "<cmd>lua require('omnisharp_extended').lsp_definition()<CR>",
        opts = { desc = "Go To Definition" },
      },
      {
        mode = "n",
        lhs = "<leader>lni",
        rhs = "<cmd>DotnetUI new_item<cr>",
        opts = { desc = "Add new .NET sln/proj/globaljson item" },
      },
      {
        mode = "n",
        lhs = "<leader>lnf",
        rhs = "<cmd>DotnetUI file bootstrap<cr>",
        opts = { desc = "Bootstrapping a new C# file" },
      },
      {
        mode = "n",
        lhs = "<leader>lpra",
        rhs = "<cmd>DotnetUI project reference add<cr>",
        opts = { desc = "Add new Project reference" },
      },
      {
        mode = "n",
        lhs = "<leader>lppa",
        rhs = "<cmd>DotnetUI project package add<cr>",
        opts = { desc = "Add new Nuget Package" },
      },
    }
  end

  return vim.list_extend(ft_keymap, common_keymap)
end

return function(bufnr)
  local buf_ft = vim.bo.filetype
  local keymap_setter = vim.api.nvim_buf_set_keymap
  local keymap = get_bindings(buf_ft)
  for _, keybinding in ipairs(keymap) do
    keymap_setter(
      bufnr,
      keybinding.mode,
      keybinding.lhs,
      keybinding.rhs,
      vim.tbl_deep_extend("keep", opts, keybinding.opts)
    )
  end
end
