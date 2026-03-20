# AGENTS.md — Neovim Configuration Repository

Guidance for agentic coding agents operating in this Neovim configuration repo.

## Repository Overview

Neovim configuration supporting macOS, Linux (WSL2), and Windows. Uses **lazy.nvim**
for plugin management with a modular, one-plugin-per-file structure.

---

## Build / Lint / Test Commands

There is no Makefile, CI pipeline, or test runner for the config itself. Validation is
done manually inside Neovim.

### Lua formatting (only automated tool)
```sh
# Format all Lua files (requires stylua on PATH)
stylua .

# Format a single file
stylua lua/editing/blink-cmp.lua

# Check without writing (dry run)
stylua --check .
```
Settings live in `stylua.toml`: 100-column width, 2-space indent, double quotes, always
use call parentheses.

### Neovim health checks (run inside Neovim)
```vim
:checkhealth
:checkhealth nvim-treesitter
:checkhealth mason
:checkhealth conform
```

### Plugin management (inside Neovim)
```vim
:Lazy update      " Update all plugins
:Lazy clean       " Remove unused plugins
:Lazy profile     " Check startup time
:Mason            " Manage LSP/DAP/formatter installations
:TSUpdate         " Update treesitter parsers
```

There is no "single test" command — config correctness is verified by restarting Neovim
and running `:checkhealth`.

---

## Repository Structure

```
init.lua                          Entry point (loads settings + plugin manager)
lua/
  plugin-manager.lua              lazy.nvim bootstrap; imports all category dirs
  settings/
    options.lua                   vim.opt settings
    keymappings.lua               Global non-plugin keymaps
    commands.lua                  Custom :commands
  editing/                        Editor UI plugins (treesitter, completion, neo-tree…)
  lsp-conf/                       LSP setup (mason, conform, nvim-lspconfig…)
  git/                            Git plugins (gitsigns, neogit, octo, codediff)
  debug/                          DAP adapters (python, js, .NET)
  testing/                        Test runners (neotest, kulala, nvim-coverage)
  document-tools/                 LaTeX, Markdown, Zettelkasten
  llms/                           AI plugins (codecompanion, mcphub)
  plugins/                        Misc plugins (colorscheme, whichkey, noice…)
  utils/
    constants/
      init.lua                    KEYBINDING_OPTS, OS constants, image paths
      mason_servers.lua           Central LSP/DAP/formatter/linter lists
      icons.lua                   Nerd Font glyph aliases
      ignores.lua                 File/dir ignore patterns
    get-values-on-os.lua          OS-conditional value resolver
    keymaps_setter.lua            Buffer-local bulk keymap helper
lsp/                              Per-language LSP server configs (plain tables)
ftplugin/                         Filetype-specific Neovim settings
stylua.toml                       Lua formatter config
.luarc.json                       Lua LSP globals (vim, require, pairs, etc.)
```

---

## Code Style Guidelines

### Lua Formatting (stylua)
- **Column width:** 100 characters
- **Indentation:** 2 spaces (no tabs)
- **Strings:** double quotes preferred (`AutoPreferDouble`)
- **Call parentheses:** always include them
- Run `stylua .` before committing any Lua changes.

### Imports / Requires
- Use dot-notation paths relative to `lua/`: `require("utils.constants")` → `lua/utils/constants/init.lua`
- Use kebab-case filenames: `get-values-on-os.lua`, `blink-cmp.lua`
- Always `require` at the top of a function or config block, not at module level, unless
  the dependency is guaranteed to be loaded (lazy.nvim handles ordering).
- Shared constants belong in `lua/utils/constants/`; do not inline magic strings or
  repeated tables.

### Plugin File Structure
Each plugin lives in exactly one file inside the appropriate category directory and
returns a lazy.nvim spec table (or array of tables):

```lua
-- Minimal spec — lazy.nvim calls require("plugin").setup(opts) automatically
return {
  "author/plugin-name",
  opts = { ... },
}

-- Full spec — use config when setup requires custom logic
return {
  "author/plugin-name",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "other/dep" },
  config = function(_, opts)
    require("plugin").setup(opts)
    -- additional setup logic
  end,
  keys = { ... },
}

-- Multiple related plugins in one file
return {
  { "plugin/one", opts = {} },
  { "plugin/two", config = function() ... end },
}
```

**Rules:**
- Never use both `opts` and `config` in the same spec — pick one.
- Simple plugins: prefer `opts = {}` (less boilerplate).
- Complex plugins: use `config = function(_, opts) ... end`.
- One concern per file; if a helper plugin is trivially small, it may live in the same
  file as the plugin that depends on it.

### Keymaps
Three patterns exist; use the one appropriate to context:

1. **Plugin lazy-load keys** (preferred for plugin-specific bindings):
   ```lua
   local KEYBINDING_OPTS = require("utils.constants").KEYBINDING_OPTS
   keys = {
     vim.tbl_deep_extend("force", {
       "<leader>gs", "<cmd>lua require('gitsigns').stage_hunk()<cr>", desc = "Stage Hunk",
     }, KEYBINDING_OPTS),
   }
   ```

2. **Which-key registration** (for LSP and filetype keymaps):
   ```lua
   require("which-key").add({
     { "<leader>lh", function() vim.lsp.inlay_hint.enable() end, desc = "Toggle Hints" },
   })
   ```

3. **Raw vim.keymap.set** (for non-plugin global keymaps in `lua/settings/keymappings.lua`):
   ```lua
   local opts = require("utils.constants").KEYBINDING_OPTS
   vim.keymap.set("n", "<leader>x", "<cmd>Neotree toggle<cr>", vim.tbl_deep_extend("force", opts, { desc = "Toggle Explorer" }))
   ```

**Always** include a `desc` field on every keymap. Always merge with `KEYBINDING_OPTS`
(`{ noremap = true, silent = true, nowait = true }`).

### LSP Server Configs (`lsp/` directory)
Files here are **not** lazy.nvim specs — they return plain setting tables consumed by
`nvim-lspconfig`:
```lua
-- lsp/ts_ls.lua
return {
  filetypes = { "typescript", "javascript" },
  settings = { typescript = { inlayHints = { ... } } },
}
```
These are loaded by `lua/lsp-conf/nvim-lspconfig.lua`. Do not call `setup()` inside them.

### Adding a New LSP Server
1. Add the server name to the `lsp` array in `lua/utils/constants/mason_servers.lua`.
2. Optionally create `lsp/servername.lua` if non-default settings are needed.
3. Keymaps are applied automatically by `lua/lsp-conf/nvim-lspconfig.lua`.

### Adding a New Plugin
1. Create `lua/[category]/plugin-name.lua` returning a lazy.nvim spec.
2. No manual registration needed — lazy.nvim scans all files in each category dir.
3. Prefer default plugin configuration unless there's a specific reason to override.

### OS-Conditional Values
Use the provided utility; do not branch on `vim.uv.os_uname().sysname` inline:
```lua
local get_values_on_os = require("utils.get-values-on-os")
local viewer = get_values_on_os({
  Windows_NT = "SumatraPDF",
  Linux      = "Sioyek",    -- WSL2
  Darwin     = "Sioyek",
})
-- Pass true as second arg to treat Darwin same as Linux automatically
```

### Naming Conventions
- **Lua files:** kebab-case (`blink-cmp.lua`, `get-values-on-os.lua`)
- **Lua modules/variables:** snake_case (`local my_var`, `local get_values_on_os`)
- **Constants:** UPPER_SNAKE_CASE (`KEYBINDING_OPTS`, `DARWIN`)
- **Which-key group prefixes:** single letter after `<leader>` (see `lua/plugins/whichkey.lua`)

### Error Handling
- Wrap optional feature requires in `pcall` when the module may not be present:
  ```lua
  local ok, plugin = pcall(require, "optional-plugin")
  if not ok then return end
  ```
- For LSP callbacks and DAP configs, use `vim.notify` with a level:
  ```lua
  vim.notify("Message", vim.log.levels.WARN)
  ```

### Globals Allowed by .luarc.json
The Lua LSP is configured to recognise these as globals (do not `require` them):
`vim`, `require`, `on`, `enable`, `pairs`, `ipairs`, `pcall`

---

## Key Leader Prefix Map

| Prefix | Purpose |
|--------|---------|
| `<leader>b` | Buffer operations |
| `<leader>f` | Find files/text (snacks picker) |
| `<leader>g` | Git operations |
| `<leader>l` | LSP operations |
| `<leader>e` | Editing |
| `<leader>u` | Utilities |
| `<leader>x` | Explorer (neo-tree) |
| `<leader>d` | Debug (DAP) |
| `<leader>T` | Testing (neotest) |
| `<leader>n` / `<leader>z` | Notes / Zettelkasten |
| `<leader><leader>c` | AI (CodeCompanion) |

Leader key is **Space**. All groups are registered in `lua/plugins/whichkey.lua`.

---

## No Cursor or Copilot Rules

Neither `.cursorrules`, `.cursor/rules/`, nor `.github/copilot-instructions.md` exist
in this repository. `CLAUDE.md` (repository root) is the sole agent instruction file.
