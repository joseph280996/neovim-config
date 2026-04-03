# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

Neovim configuration supporting Windows, Linux (WSL2), and macOS. Uses **lazy.nvim** for plugin management with modular feature categories.

## Architecture

### Entry Point and Loading Order

1. `init.lua` - Loads settings and plugin manager:
   - `lua/settings/options.lua` - Core Neovim options
   - `lua/settings/commands.lua` - Custom commands
   - `lua/settings/keymappings.lua` - Global keymaps
   - `lua/plugin-manager.lua` - Lazy.nvim bootstrap and plugin loading

### Plugin Organization

Plugins in `lua/` organized by feature category (one plugin per file returning a lazy.nvim spec):

- **editing/** - Editor enhancements (snacks picker/dashboard, blink-cmp completion, neo-tree, treesitter, trouble diagnostics)
- **lsp-conf/** - LSP setup, formatters, linters (mason, conform, nvim-lint)
- **git/** - Git integration (gitsigns, neogit, codediff, octo)
- **debug/** - Debugging tools (nvim-dap with Python, JS, .NET support)
- **testing/** - Test frameworks (neotest with pytest, jest, .NET adapters, kulala for HTTP)
- **document-tools/** - Document editing (vimtex, markdown, zk notes)
- **llms/** - AI integration (codecompanion for Claude, mcphub)
- **plugins/** - Miscellaneous (colorscheme, whichkey, notify, easy-dotnet, leetcode)

### Language Server Configuration

**Central server lists:** `lua/utils/constants/mason-servers.lua` (15 LSP servers, 3 DAP adapters, 4 formatters, 2 linters)

**LSP setup flow:**

1. `lsp-conf/mason.lua` - Mason package manager
2. `lsp-conf/mason-lsp.lua` - Installs LSP servers via Mason
3. `lsp-conf/nvim-lspconfig.lua` - Configures capabilities, keymaps, folding
4. `lsp/[language].lua` - Language-specific settings (optional)
5. `ftplugin/[filetype].lua` - Filetype-specific behavior (optional)

**Code formatting:** `lsp-conf/conform.lua` (ruff_format, prettier/prettierd, stylua, clang-format, google-java-format, sqlfluff, tex-fmt)

### Keymap Structure

Leader key is **Space**. Namespaces defined in `lua/plugins/whichkey.lua`:

| Prefix              | Purpose                           |
| ------------------- | --------------------------------- |
| `<leader>b`         | Buffer operations                 |
| `<leader>f`         | File/text finding (snacks picker) |
| `<leader>g`         | Git operations                    |
| `<leader>l`         | LSP operations                    |
| `<leader>e`         | Editing operations                |
| `<leader>u`         | Utilities (Kulala, tabs)          |
| `<leader>x`         | Explorer (neotree)                |
| `<leader>m`         | Molten (Jupyter notebooks)        |
| `<leader>d`         | Debug                             |
| `<leader>T`         | Testing                           |
| `<leader>p`         | Package managers (Lazy, Mason)    |
| `<leader>n`         | Notes                             |
| `<leader>z`         | Notes/Zettelkasten                |
| `<leader>v`         | VimTex                            |
| `<leader>s`         | Surround                          |
| `<leader><leader>c` | AI (CodeCompanion)                |

### Utilities

**`lua/utils/` provides:**

- `constants/init.lua` - Keybinding options, OS detection, image paths
- `constants/icons.lua` - Icon definitions for UI
- `constants/ignores.lua` - File/directory ignore patterns
- `constants/mason-servers.lua` - Centralized tool lists
- `get-values-on-os.lua` - OS-specific value resolution
- `get-dashboard-image.lua` - Time-based dashboard image selector
- `keymaps_setter.lua` - Buffer-local keymap helper

### Multi-OS Support

OS detection via `vim.uv.os_uname().sysname`. Use `require("utils.get-values-on-os")` for OS-conditional values:

- VimTex viewers: SumatraPDF (Windows/WSL), Sioyek (macOS)
- Java paths: Different JDK locations per OS
- .NET secrets: OS-specific UserSecrets paths

## Language-Specific Setup

### C#/.NET

- **Files:** `ftplugin/cs.lua`, `lsp/omnisharp.lua`, `lua/plugins/easy-dotnet.lua`
- OmniSharp LSP with extended navigation
- Easy-dotnet plugin for .NET project management
- Keymaps: `<leader>lni` (new item), `<leader>lpp` (package popup)

### Java

- **Files:** `ftplugin/java.lua`, `lsp/jdtls.lua`, `lua/lsp-conf/jdtls.lua`
- Eclipse JDTLS (Java Development Tools Language Server)
- Integrated debugger support
- **Requires:** junit.jar, gson.jar, hamcrest.jar for debugging

### Python

- **Files:** `lsp/pyright.lua`, `lua/debug/dap-python.lua`
- Pyright LSP with Ruff for linting/formatting
- Debugpy for debugging
- Neotest pytest adapter for testing

### JavaScript/TypeScript

- **Files:** `lsp/ts_ls.lua`, `lua/debug/dap-vscode-js.lua`
- ts_ls (TypeScript Language Server) for LSP
- Prettier/prettierd for formatting
- vscode-js-debug for debugging
- Neotest jest adapter for testing

### LaTeX

- **Files:** `lua/document-tools/vimtex.lua`, `ftplugin/tex.lua`
- VimTex plugin with latexmk compiler
- PDF viewer integration (OS-specific)
- Keymaps under `<leader>v` and `<leader>vt`

### C/C++

- **Files:** `lsp/clangd.lua`
- Clangd LSP for C/C++ development
- clang-format for code formatting
- **Requires:** gcc/clang compiler (for tree-sitter compilation)

## Common Workflows

### Adding a New Plugin

It is preferred to use the default configuration of the plugin unless specified differently.

Do the following steps when adding a new plugin:

1. Create file in category: `lua/[category]/plugin-name.lua`
2. Search for plugin in GitHub or Codeberg
3. Search for recommended lazy.nvim default setup
4. Apply the setup to the file created in step 1.
5. Restart Neovim - lazy.nvim auto-installs

### Adding LSP Server

Most LSP servers are installed from Mason.

Follow these steps to properly set up the server:

1. Add server name to `lua/utils/constants/mason-servers.lua` in the `lsp` array. Mason will automatically prompt for installation when you restart Neovim.
2. (Optional) Create `lsp/servername.lua` if you need custom server settings. The LSP server will work with defaults if this file is omitted.
3. Keymaps apply automatically (defined in `lua/lsp-conf/nvim-lspconfig.lua`)

### Modifying Keymaps

| Location                       | Purpose                                 |
| ------------------------------ | --------------------------------------- |
| `lua/settings/keymappings.lua` | Non-plugin-related keymaps              |
| Plugin file `keys = {}`        | Plugin-specific keymaps                 |
| `lua/plugins/whichkey.lua`     | Which-key group and keymaps (Preferred) |
| `lsp-conf/nvim-lspconfig.lua`  | LSP keymaps (on_attach)                 |
| `ftplugin/[filetype].lua`      | Filetype-specific                       |

### Highlight Key Commands

| Action                       | Keys/Command              |
| ---------------------------- | ------------------------- |
| Format buffer                | `<leader>lf`              |
| Start debug                  | `<F5>`                    |
| Toggle breakpoint            | `<F9>`                    |
| Debugging Step over/into/out | `<F10>`/`<F11>`/`<S-F11>` |
| Run nearest test             | `<leader>Tr`              |
| Debug test                   | `<leader>Td`              |
| Stage hunk                   | `<leader>gs`              |
| Neogit UI                    | `<leader>gg`              |
| Toggle neo-tree              | `<leader>x`               |
| CodeCompanion chat           | `<leader><leader>cc`      |

## Special Commands

- `:NewJupyterNotebook` - Creates empty Jupyter notebook
- `:Lazy` - Plugin manager UI
- `:Mason` - LSP/DAP/formatter/linter installer
- `:TSUpdate` - Update tree-sitter parsers
- `:checkhealth` - Diagnose missing dependencies

## Code Style

- **Lua formatting:** stylua (see `stylua.toml` - 100 column, 2-space indent)
- **LSP config:** `.luarc.json` provides LuaJIT runtime and Vim API globals
- **Convention:**
  - One plugin per file. If a plugin config is simple enough, can put it in the same file as the plugin that depends on the plugin in question.
  - Shared constants in `utils/constants/`
  - Utility functions should be in `utils/`

## AI Integration

**CodeCompanion** (`lua/llms/codecompanion.lua`):

- Chat toggle: `<leader><leader>cc`
- Command palette: `<leader><leader>cp`
- History browsing: `gh` keymap in chat
- Save chat: `sc` keymap in chat
- Close chat: `<C-x>`

**MCPHub Extension:** Model Context Protocol integration via mcphub

## Dependencies & Requirements

### Core Dependencies

- **Neovim:** Version 0.10+ (0.11+ recommended for latest features)
- **Git:** Required for lazy.nvim and version control features
- **Node.js:** Required for TypeScript/JavaScript LSP and DAP
- **Python 3:** Required for Python LSP and Jupyter notebook support
- **Ripgrep (rg):** Required for telescope/snacks file/text search

### Language-Specific Requirements

| Language | Requirements |
|----------|-------------|
| **C#/.NET** | .NET SDK 6.0+ |
| **Java** | JDK 17+, junit.jar, gson.jar, hamcrest.jar (for debugging) |
| **Python** | python3-venv, debugpy |
| **JavaScript/TypeScript** | Node.js 18+, npm |
| **C/C++** | gcc/clang, cmake (optional) |
| **LaTeX** | texlive or miktex, latexmk, SumatraPDF (Windows/WSL) or Sioyek (macOS) |
| **Jupyter** | Python kernel, molten-nvim requires Wezterm terminal |

### Optional Dependencies

- **stylua:** Lua formatting (auto-installed via Mason)
- **prettier:** Multi-language formatting (auto-installed via Mason)
- **jq:** JSON formatting for HTTP testing
- **xmllint:** XML/HTML formatting for HTTP testing
- **vale:** Prose linting (auto-installed via Mason)
- **cmake-format:** CMake formatting (auto-installed via Mason)

## Additional Language Support

### SQL

- **Files:** `lsp/sqlls.lua`
- SQL language server with sqlfluff formatting
- Auto-completion for SQL keywords and tables

### Markdown

- **Files:** `document-tools/markdown.lua`, `ftplugin/markdown.lua`
- Marksman LSP for navigation and completion
- Render-markdown plugin for enhanced preview
- Vale linting for prose quality

### Cucumber/Gherkin

- **Files:** `lsp/cucumber_language_server.lua`
- BDD test scenarios with syntax highlighting and LSP support

### Tailwind CSS

- **Files:** `lsp/tailwindcss.lua`
- Tailwind CSS IntelliSense with class completion

### OpenAPI/Spectral

- **Files:** `lsp/spectral.lua`
- OpenAPI specification linting and validation

### Harper (Grammar/Spell Check)

- **LSP Server:** `harper_ls` (installed via Mason)
- Grammar and spell checking for prose
- Works with Markdown, text files, and comments
- Real-time grammar suggestions

## Jupyter Notebook Support

**Plugins:** `jupytext.nvim` + `molten-nvim` (`lua/editing/ipynb-plugins.lua`)

### Setup Requirements

1. **Wezterm terminal** - Required for image rendering
2. **Python kernel** - Install via `pip install ipykernel`
3. **UpdateRemotePlugins** - Run after installing molten-nvim

### Workflow

1. Create notebook: `:NewJupyterNotebook filename`
2. Initialize kernel: `<leader>mi`
3. Evaluate cell: `<leader>mec`
4. Evaluate line: `<leader>mel`
5. Navigate cells: `<leader>mcn` (next), `<leader>mcp` (previous)

### Key Features

- Edit `.ipynb` files as native Neovim buffers (via jupytext)
- Execute cells inline with output below
- Image rendering in terminal via Wezterm
- Visual mode evaluation: `<leader>me` (visual mode)

## HTTP Testing with Kulala

**Plugin:** `kulala.nvim` (`lua/testing/kulala.lua`)

### Features

- Execute HTTP requests from `.http` or `.rest` files
- Multiple environment support (dev, test, prod)
- JSON/XML/HTML response formatting
- Visual request/response in split or float

### Usage

1. Create `.http` file with requests
2. Run current request: `<leader>ukr`
3. Run all requests: `<leader>uka`
4. View response body or headers

### Request Format

```http
GET https://api.example.com/users
Accept: application/json
###
POST https://api.example.com/users
Content-Type: application/json

{
  "name": "John Doe"
}
```

## LeetCode Integration

**Plugin:** `leetcode.nvim` (`lua/plugins/leetcode.lua`)

### Setup

- Command: `:Leet`
- Default language: C++
- Storage: `~/.local/share/nvim/leetcode/`
- Cache: `~/.cache/nvim/leetcode/`

### Features

- Browse and solve LeetCode problems in Neovim
- Submit solutions directly
- View problem descriptions and test cases
- Track progress and history

## UI & UX Enhancements

### Snacks Dashboard

**File:** `lua/editing/snacks/dashboard.lua`

- Custom ASCII art that changes by time of day
- Quick actions: Browse repo, Find projects, Find files
- Recent files and sessions
- Git status integration

### Status Line (Lualine)

**File:** `lua/editing/lualine.lua`

- Git branch, diff, and diagnostics
- LSP status and active clients
- File encoding and format
- Cursor position and progress

### Notifications (nvim-notify + noice.nvim)

**Files:** `lua/plugins/notify.lua`, `lua/plugins/noice.lua`

- Floating notification messages
- Command-line UI in floating window
- LSP progress indicators
- Search count display

### Window Management

**Plugins:**

- `smart-splits.nvim` - Intelligent window resizing and navigation
- `nvim-window-picker` - Visual window selection
- `no-neck-pain.nvim` - Centered buffer mode for focused writing

### Code Navigation

**Plugins:**

- `arrow.nvim` - Quick buffer/file bookmarks
- `incline.nvim` - Floating filename labels
- `treesitter` - Syntax-aware navigation and text objects

## Testing & Coverage

### Neotest

**File:** `lua/testing/neotest.lua`

- Unified test interface for multiple frameworks
- Visual test runner with inline results
- Debug failed tests with DAP integration

**Supported Adapters:**

- Python: `neotest-python` (pytest)
- JavaScript/TypeScript: `neotest-jest`
- .NET: `neotest-dotnet`

### Coverage

**File:** `lua/testing/nvim-coverage.lua`

- Load and display code coverage
- Visual signs for covered/uncovered lines
- Coverage summary window
- Load from lcov files

**Key Mappings:**

- `<leader>Tcc` - Load coverage
- `<leader>Tct` - Toggle coverage signs
- `<leader>Tcs` - Show coverage summary

## Git Workflow

### GitSigns

**File:** `lua/git/gitsigns.lua`

- Inline git blame
- Hunk staging/unstaging
- Diff view for hunks
- Navigate hunks: `]c` (next), `[c` (previous)

### Neogit

**File:** `lua/git/neogit.lua`

- Magit-like Git interface
- Stage/unstage files and hunks
- Commit workflow
- Launch with `<leader>gg`

### CodeDiff

**File:** `lua/git/codediff.lua`

- Visual diff view for commits and branches
- Compare against master/main: `<leader>gdm`
- Compare file against main: `<leader>gdfm`
- Compare file against HEAD: `<leader>gdfh`
- Git history browser: `<leader>gh`

### Octo

**File:** `lua/git/octo.lua`

- GitHub integration for issues and PRs
- Review pull requests in Neovim
- Comment and approve PRs

## Troubleshooting

### Common Issues

**LSP not starting:**

1. Run `:LspInfo` to check server status
2. Verify server installed: `:Mason`
3. Check logs: `:lua vim.cmd('e '..vim.lsp.get_log_path())`
4. Ensure language-specific requirements met (see Dependencies section)

**Formatter not working:**

1. Check conform.nvim config: `:ConformInfo`
2. Verify formatter installed: `:Mason`
3. Ensure file type is configured in `lua/lsp-conf/conform.lua`

**DAP not connecting:**

1. Verify debugger installed: `:Mason`
2. Check DAP configuration: `:lua require('dap').configurations`
3. Ensure language-specific adapters configured
4. Java: Verify junit/gson/hamcrest jars in correct location

**Treesitter highlighting broken:**

1. Update parsers: `:TSUpdate`
2. Check health: `:checkhealth nvim-treesitter`
3. Ensure compiler available (gcc/clang)

**Git signs not showing:**

1. Ensure in git repository: `:!git status`
2. Check gitsigns status: `:Gitsigns toggle_signs`
3. Run health check: `:checkhealth gitsigns`

**Completion not working:**

1. Check blink-cmp status: `:lua print(vim.inspect(require('blink.cmp').enabled))`
2. Verify LSP attached: `:LspInfo`
3. Check sources configuration in `lua/editing/blink-cmp.lua`

**Jupyter notebook issues:**

1. Ensure Wezterm terminal in use
2. Run `:UpdateRemotePlugins` after installing molten-nvim
3. Verify Python kernel: `jupyter kernelspec list`
4. Check molten status: `:MoltenInfo`

### Health Checks

Run comprehensive diagnostics:

```vim
:checkhealth
:checkhealth nvim-treesitter
:checkhealth mason
:checkhealth conform
:checkhealth nvim-lint
```

## Performance Tips

### Lazy Loading

- Most plugins lazy-load on events, commands, or filetypes
- Check startup time: `:Lazy profile`
- Disable unused language plugins in respective files

### LSP Optimization

- Disable unused LSP servers in `lua/utils/constants/mason-servers.lua`
- Configure per-project LSP settings via `.nvim.lua` files
- Use `vim.lsp.buf.format({ async = true })` for non-blocking formatting

### Treesitter Performance

- Disable treesitter for large files (>1MB)
- Configure fold settings in `lua/lsp-conf/nvim-lspconfig.lua`
- Use `ensure_installed` in treesitter config to only install needed parsers

## Project-Specific Configuration

### .nvim.lua Support

Create `.nvim.lua` in project root for custom settings:

```lua
-- Example: Override LSP settings for project
vim.lsp.start({
  name = "custom-lsp",
  cmd = { "custom-lsp-server" },
  root_dir = vim.fn.getcwd(),
})

-- Example: Project-specific keymaps
vim.keymap.set("n", "<leader>pt", ":!make test<CR>")
```

### EditorConfig

Respects `.editorconfig` files for indentation and formatting preferences.

## Best Practices

### Plugin Management

- **Keep plugins updated:** Run `:Lazy update` regularly
- **Review changes:** Check plugin changelogs before updating
- **Pin critical plugins:** Use specific commits/versions for stability (see `lua/plugins/leetcode.lua` for example)
- **Remove unused plugins:** Comment out or delete plugin files you don't use

### LSP Configuration

- **Use mason-lspconfig:** Automatically installs and configures LSP servers
- **Override defaults carefully:** Create language-specific configs in `lsp/` directory
- **Test incrementally:** Add one server at a time and verify functionality
- **Check capabilities:** Ensure LSP server supports features you need

### Keymap Organization

- **Prefix consistency:** Use which-key groups for discoverability
- **Document mappings:** Add `desc` field to all keymaps
- **Avoid conflicts:** Check existing mappings with `:map <key>`
- **Use buffer-local maps:** For filetype-specific commands

### Code Organization

- **One concern per file:** Each plugin in separate file
- **Shared constants:** Use `utils/constants/` for reusable values
- **OS-specific logic:** Centralize in `utils/get-values-on-os.lua`
- **Lazy loading:** Configure `event`, `cmd`, `ft` for optimal startup time

### Debugging Workflow

1. Set breakpoints with `<F9>` before starting debugger
2. Use conditional breakpoints for complex scenarios
3. Leverage DAP UI for variable inspection
4. Test with simplified inputs first
5. Check DAP logs if connection fails

### Git Best Practices

- **Review hunks:** Use `<leader>gp` to preview changes before staging
- **Stage incrementally:** Stage hunks individually with `<leader>gs`
- **Use Neogit:** For complex commits with detailed messages
- **Review PRs in Neovim:** Use Octo.nvim for GitHub workflows

## Extending the Configuration

### Adding a New Language

1. **Add LSP server** to `lua/utils/constants/mason-servers.lua`
2. **Create LSP config** in `lsp/language.lua` if custom settings needed
3. **Add treesitter parser** in `lua/editing/treesitter.lua`
4. **Configure formatter** in `lua/lsp-conf/conform.lua`
5. **Add linter** in `lua/lsp-conf/nvim-lint.lua` (optional)
6. **Create ftplugin** in `ftplugin/filetype.lua` for filetype-specific behavior
7. **Add DAP config** in `lua/debug/` if debugging support needed
8. **Add test adapter** in `lua/testing/neotest.lua` if testing support needed

### Creating Custom Commands

Add to `lua/settings/commands.lua`:

```lua
vim.api.nvim_create_user_command("MyCommand", function(opts)
  -- Command implementation
  print("Executing with args: " .. opts.args)
end, {
  nargs = "?",      -- Number of arguments: 0, 1, *, +, ?
  complete = "file", -- Completion type
  desc = "My custom command"
})
```

### Adding Custom Snippets

Integrate with blink-cmp's snippet support:

1. Configure snippet engine in `lua/editing/blink-cmp.lua`
2. Add snippets to language-specific files
3. Use snippet expansion with completion

## Resources & References

### Official Documentation

- **Neovim:** https://neovim.io/doc/
- **Lazy.nvim:** https://github.com/folke/lazy.nvim
- **Mason:** https://github.com/williamboman/mason.nvim
- **nvim-lspconfig:** https://github.com/neovim/nvim-lspconfig
- **nvim-dap:** https://github.com/mfussenegger/nvim-dap

### Community

- **Reddit:** r/neovim
- **Discord:** Neovim Discord server
- **GitHub Discussions:** Plugin-specific discussions

### Learning Resources

- **TJ DeVries YouTube:** Neovim plugin development
- **ThePrimeagen:** Vim/Neovim tutorials
- **Neovim docs:** `:help` command in Neovim

## Maintenance

### Regular Tasks

- **Update plugins:** `:Lazy update` (weekly)
- **Update LSP servers:** `:Mason` then `U` on outdated servers (monthly)
- **Update treesitter parsers:** `:TSUpdate` (as needed)
- **Review lazy-lock.json:** Commit to track plugin versions
- **Clean unused plugins:** `:Lazy clean`
- **Review logs:** Check for errors in `:messages` and `:checkhealth`

### Backup Strategy

- **Git repository:** This config is version-controlled
- **lazy-lock.json:** Tracks exact plugin versions for reproducibility
- **Local backups:** Consider backing up `~/.local/share/nvim/` for plugin data

---

**Last Updated:** 2026-01-31  
**Neovim Version:** 0.11.5  
**Config Version:** See git commit history
