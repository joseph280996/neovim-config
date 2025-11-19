# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a comprehensive Neovim configuration supporting Windows, Linux (WSL2), and macOS. The configuration uses **lazy.nvim** for plugin management and is organized into modular feature categories.

## Architecture

### Entry Point and Loading Order

1. `init.lua` - Loads settings and plugin manager in sequence:
   - `settings/options.lua` - Core Neovim options
   - `settings/commands.lua` - Custom commands
   - `settings/keymappings.lua` - Global keymaps
   - `plugin-manager.lua` - Lazy.nvim bootstrap and plugin loading

### Plugin Organization

Plugins are organized by feature category in `lua/` directories:

- **editing/** - Text editing, UI, completion (treesitter, blink-cmp, lualine, neotree)
- **lsp-conf/** - LSP setup, formatters, linters (mason, conform, nvim-lint)
- **git/** - Git integration (gitsigns, neogit, diffview, octo)
- **debug/** - Debugging tools (nvim-dap with Python, JS, .NET support)
- **testing/** - Test frameworks (neotest with pytest, jest, .NET adapters)
- **document-tools/** - Document editing (vimtex, markdown, zk notes)
- **llms/** - AI integration (codecompanion for Claude, mcphub)
- **plugins/** - Miscellaneous plugins (colorscheme, whichkey, notify, leetcode)

Each plugin is one file that returns a lazy.nvim spec.

### Language Server Configuration

**Central server lists:** `lua/utils/constants/mason_servers.lua`
- 18 LSP servers, 3 DAP adapters, 4 formatters, 2 linters

**LSP setup flow:**
1. `lsp-conf/mason.lua` - Installs servers via Mason
2. `lsp-conf/nvim-lspconfig.lua` - Configures capabilities, keymaps, folding
3. `lsp/[language].lua` - Language-specific settings (e.g., `lua_ls.lua`, `pyright.lua`)
4. `ftplugin/[filetype].lua` - Filetype-specific behavior

**Code formatting:** `lsp-conf/conform.lua` configures per-language formatters (ruff, prettier, stylua, clang-format, google-java-format, sqlfluff)

### Keymap Structure

Keymaps follow a leader-key namespace defined in `lua/plugins/whichkey.lua`:

```
<leader>b   Buffer operations
<leader>f   File/text finding (snacks picker)
<leader>g   Git operations
<leader>l   LSP operations (format, hover, diagnostics, inlay hints)
<leader>e   Editing tools
<leader>u   Utilities
<leader>x   Explorer (neotree)
<leader>d   Debug
<leader>T   Testing
<leader>p   Package managers (Lazy, Mason)
<leader>n   Notes
<leader>z   Zettelkasten
<leader>v   VimTex
```

Leader key is **Space**.

### Utilities and Helpers

**`lua/utils/` provides:**
- `constants/init.lua` - Keybinding options, OS detection, image paths
- `constants/icons.lua` - 60+ icon definitions for UI
- `constants/mason_servers.lua` - Centralized tool lists
- `get-values-on-os.lua` - OS-specific value resolution
- `keymaps_setter.lua` - Buffer-local keymap helper

### Multi-OS Support

The config detects OS via `vim.uv.os_uname().sysname` and adapts:
- **VimTex viewers:** SumatraPDF (Windows/WSL), Sioyek (macOS)
- **Java paths:** Different JDK locations per OS
- **.NET secrets:** OS-specific UserSecrets paths

Use `require("utils.get-values-on-os")` for OS-conditional values.

## Language-Specific Setup

### C#/.NET (`ftplugin/cs.lua`, `lsp/omnisharp.lua`)
- OmniSharp LSP with extended navigation
- Easy-dotnet plugin for project management
- Keymaps: `<leader>lni` (new item), `<leader>lpp` (package popup)
- Auto-build before debug sessions

### Java (`ftplugin/java.lua`, `lsp/jdtls.lua`)
- JDTLS with debugger integration
- Custom workspace paths per project
- **Prerequisites:** junit, gson, hamcrest must be installed system-wide

### Python (`lsp/pyright.lua`, `debug/dap-python.lua`)
- Pyright for type checking, Ruff for linting/formatting
- Debugpy for debugging
- Neotest pytest adapter

### JavaScript/TypeScript (`lsp/ts_ls.lua`, `debug/dap-vscode-js.lua`)
- ts_ls LSP, prettier/prettierd formatting
- vscode-js-debug adapter
- Neotest jest adapter

### LaTeX (`document-tools/vimtex.lua`, `ftplugin/tex.lua`)
- VimTex with latexmk compilation
- PDF viewers: SumatraPDF (Windows via `scripts/sumatra.fish`), Sioyek (macOS)
- Keymaps under `<leader>v`

### C/C++ (`lsp/clangd.lua`)
- Clangd LSP, clang-format formatter
- **Prerequisites:** Requires cc/gcc/clang for tree-sitter (see README FAQ)

## Common Workflows

### Adding a New Plugin

1. Create file in appropriate category: `lua/[category]/plugin-name.lua`
2. Return a lazy.nvim spec:
   ```lua
   return {
     "owner/repo",
     event = "VeryLazy",  -- or cmd, ft, keys
     opts = {},
     config = function(_, opts)
       require("plugin").setup(opts)
     end
   }
   ```
3. Restart Neovim - lazy.nvim auto-installs missing plugins

### Adding LSP Server

1. Add server name to `lua/utils/constants/mason_servers.lua`
2. Create `lsp/servername.lua` if custom settings needed
3. Mason auto-installs on next startup
4. Server keymaps automatically apply (defined in `lsp-conf/nvim-lspconfig.lua`)

### Modifying Keymaps

1. **Global keymaps:** `lua/settings/keymappings.lua`
2. **Plugin-specific:** In the plugin's config file under `keys = {}`
3. **Which-key groups:** `lua/plugins/whichkey.lua`
4. **LSP keymaps:** `lsp-conf/nvim-lspconfig.lua` (on_attach function)
5. **Filetype-specific:** `ftplugin/[filetype].lua`

### Formatting and Linting

- **Format current buffer:** `<leader>lf`
- **Add formatter:** Edit `lua/lsp-conf/conform.lua`
- **Add linter:** Edit `lua/lsp-conf/nvim-lint.lua`
- **SQL formatting config:** `formatter-conf/.sqlfluff`

### Debugging

- **Start debug:** `<F5>`
- **Toggle breakpoint:** `<F9>`
- **Step over/into/out:** `<F10>/<F11>/<S-F11>`
- **DAP UI auto-opens** on debug start
- **Language adapters:** `debug/dap-python.lua`, `debug/dap-vscode-js.lua`, `debug/nvim-dap.lua` (.NET)

### Testing

- **Run test:** `<leader>Tr` (run nearest)
- **Debug test:** `<leader>Td`
- **Test file:** `<leader>Tf`
- **Test suite:** `<leader>Ts`
- **Adapters:** Python (pytest), .NET (xUnit/NUnit), JavaScript (jest)

### Git Operations

- **Stage hunk:** `<leader>gs`
- **Reset hunk:** `<leader>gr`
- **Preview hunk:** `<leader>gp`
- **Next/prev hunk:** `<leader>gj` / `<leader>gk`
- **Neogit UI:** `<leader>gg`
- **Diffview:** `<leader>gd`
- **GitHub (Octo):** `:Octo` commands

## Special Commands

- `:NewJupyterNotebook` - Creates empty Jupyter notebook with proper JSON structure
- `:Lazy` - Plugin manager UI
- `:Mason` - LSP/DAP/formatter/linter installer
- `:TSUpdate` - Update tree-sitter parsers
- `:checkhealth` - Diagnose missing dependencies

## Code Style

- **Lua formatting:** stylua with 100 column width, 2-space indent
- **LSP config:** `.luarc.json` provides LuaJIT runtime and Vim API globals
- **Convention:** One plugin per file, shared constants in `utils/constants/`

## Prerequisites

Some tools require system-level installation (not via Mason):

- **Java development:** junit, gson, hamcrest
- **Tree-sitter (Windows):** cc/gcc/clang ([setup guide](https://github.com/nvim-treesitter/nvim-treesitter/wiki/Windows-support))
- **Telescope (optional):** fd for file finding

Run `:checkhealth` to identify missing dependencies.

## Completion Engine

Uses **blink.cmp** (Rust-based) with:
- LSP, buffer, path sources
- Snippet support (friendly-snippets, conventional commits, LaTeX)
- Fuzzy matching
- Auto-bracket insertion
- Ghost text preview

## AI Integration

**CodeCompanion** (`lua/llms/codecompanion.lua`):
- Chat with Claude AI: `<C-c>c`
- Inline editing: `<C-c>e`
- Add context with snacks file picker
- Close with `<C-x>`

## File Explorer

**Neo-tree** (`lua/editing/neotree.lua`):
- Toggle: `<leader>x`
- File nesting configuration for related files (.cs/.Designer.cs, package.json/lock files)
- Libuv file watcher, gitignore-aware

## Troubleshooting

- **Telescope requires fd:** Optional, only needed for advanced file finding (install via system package manager)
- **Tree-sitter compilation errors:** Install cc/gcc/clang per OS
- **Java LSP not working:** Verify junit/gson/hamcrest installed system-wide
- **PDF viewer not launching:** Check OS-specific viewer paths in VimTex config
