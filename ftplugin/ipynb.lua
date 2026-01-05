if not vim.g.vscode then
  local jupytext_ok, jupytext = pcall(require, "jupytext")
  if not jupytext_ok then
    return
  end

  -- Function to update PATH with conda environment
  local function update_path_with_conda()
    local conda_prefix = os.getenv("CONDA_PREFIX")
    if conda_prefix then
      local conda_bin = conda_prefix .. "/bin"
      local current_path = vim.env.PATH or ""

      -- Only add if not already in PATH
      if not string.find(current_path, conda_bin, 1, true) then
        vim.env.PATH = conda_bin .. ":" .. current_path

        -- Also update vim's internal PATH
        vim.o.path = vim.env.PATH
      end
    end
  end

  -- Update PATH when opening ipynb files
  update_path_with_conda()

  jupytext.setup({
    custom_language_formatting = {
      python = {
        extension = "md",
        style = "markdown",
        force_ft = "markdown",
      },
    },
  })
end
