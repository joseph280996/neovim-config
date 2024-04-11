local get_value_on_os = require("user.utils.get-values-on-os")

return {
  {
    "folke/which-key.nvim", -- Centralized list of all commands UI
    optional = true,
    opts = {
      keymaps_ext = {
        t = { name = "Terminal" },
      },
    },
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      size = 20,
      open_mapping = [[<C-\>]],
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = -30,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = "horizontal",
      close_on_exit = true,
      shell = get_value_on_os({ Window = "pwsh", Linux = vim.o.shell }, true),
      float_opts = {
        border = "curved",
        winblend = 0,
        highlights = {
          border = "Normal",
          background = "Normal",
        },
      },
    },
    config = function(_, opts)
      require("toggleterm").setup(opts)

      vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

      local Terminal = require("toggleterm.terminal").Terminal
      local cached_terms = {
        pwsh = Terminal:new({ cmd = "lazygit", hidden = true }),
        lazygit = Terminal:new({ cmd = "lazygit", hidden = true }),
        node = Terminal:new({ cmd = "node", hidden = true }),
        ncdu = Terminal:new({ cmd = "ncdu", hidden = true }),
        htop = Terminal:new({ cmd = "htop", hidden = true }),
        python = Terminal:new({ cmd = "python", hidden = true }),
      }

      function _TERM_TOGGLE(term_name)
        if term_name == "lazygit" then
          cached_terms.lazygit:toggle()
        elseif term_name == "pwsh" then
          cached_terms.pwsh:toggle()
        elseif term_name == "node" then
          cached_terms.node:toggle()
        elseif term_name == "ncdu" then
          cached_terms.ncdu:toggle()
        elseif term_name == "htop" then
          cached_terms.htop:toggle()
        elseif term_name == "python" then
          cached_terms.python:toggle()
        end
      end

      local direction_opts = {
        horizontal = {
          direction = "horizontal",
          size = 10,
        },
        vertical = {
          direction = "vertical",
          size = 80,
        },
        float = {
          direction = "float",
        },
      }
      local powershell_opts = { cmd = "pwsh" }
      function _CREATE_NEW_TERM() end

      local powershell_horizontal =
        Terminal:new(vim.tbl_deep_extend("keep", powershell_opts, direction_opts["horizontal"]))
      function _PS_HORIZONTAL_TOGGLE()
        powershell_horizontal:toggle()
      end

      local powershell_vertical =
        Terminal:new(vim.tbl_deep_extend("keep", powershell_opts, direction_opts["vertical"]))
      function _PS_VERTICAL_TOGGLE()
        powershell_vertical:toggle()
      end

      local powershell_float =
        Terminal:new(vim.tbl_deep_extend("keep", powershell_opts, direction_opts["float"]))
      function _PS_FLOAT_TOGGLE()
        powershell_float:toggle()
      end

      function _PS_HORIZONTAL_TOGGLE_NEW_SESSION()
        powershell_horizontal =
          Terminal:new(vim.tbl_deep_extend("keep", powershell_opts, direction_opts["horizontal"]))
        powershell_horizontal:toggle()
      end

      function _PS_VERTICAL_TOGGLE_NEW_SESSION()
        powershell_vertical =
          Terminal:new(vim.tbl_deep_extend("keep", powershell_opts, direction_opts["vertical"]))
        powershell_vertical:toggle()
      end

      function _PS_FLOAT_TOGGLE_NEW_SESSION()
        powershell_float =
          Terminal:new(vim.tbl_deep_extend("keep", powershell_opts, direction_opts["float"]))
        powershell_float:toggle()
      end

      local git_bash_opts = { cmd = "bash" }

      local function setup_gb()
        vim.cmd([[let &shell = '"C:/Program Files/Git/bin/bash.exe"']])
        vim.cmd([[let &shellcmdflag = '-s']])
      end

      local git_bash_horizontal =
        Terminal:new(vim.tbl_deep_extend("keep", git_bash_opts, direction_opts["horizontal"]))
      function _GB_HORIZONTAL_TOGGLE()
        setup_gb()
        git_bash_horizontal:toggle()
      end

      local git_bash_vertical =
        Terminal:new(vim.tbl_deep_extend("keep", git_bash_opts, direction_opts["vertical"]))
      function _GB_VERTICAL_TOGGLE()
        setup_gb()
        git_bash_vertical:toggle()
      end

      local git_bash_float =
        Terminal:new(vim.tbl_deep_extend("keep", git_bash_opts, direction_opts["float"]))
      function _GB_FLOAT_TOGGLE()
        setup_gb()
        git_bash_float:toggle()
      end

      function _GB_HORIZONTAL_TOGGLE_NEW_SESSION()
        setup_gb()
        git_bash_horizontal =
          Terminal:new(vim.tbl_deep_extend("keep", git_bash_opts, direction_opts["horizontal"]))
        git_bash_horizontal:toggle()
      end

      function _GB_VERTICAL_TOGGLE_NEW_SESSION()
        setup_gb()
        git_bash_vertical =
          Terminal:new(vim.tbl_deep_extend("keep", git_bash_opts, direction_opts["vertical"]))
        git_bash_vertical:toggle()
      end

      function _GB_FLOAT_TOGGLE_NEW_SESSION()
        setup_gb()
        git_bash_float =
          Terminal:new(vim.tbl_deep_extend("keep", git_bash_opts, direction_opts["float"]))
        git_bash_float:toggle()
      end
    end,
    keys = {
      { "<esc>", [[<C-\><C-n>]], mode = "t", buffer = 0, noremap = true },
      { "jk", [[<C-\><C-n>]], mode = "t", buffer = 0, noremap = true },
      { "<C-h>", [[<C-\><C-n><C-W>h]], buffer = 0, mode = "t", noremap = true },
      { "<C-j>", [[<C-\><C-n><C-W>j]], buffer = 0, mode = "t", noremap = true },
      { "<C-k>", [[<C-\><C-n><C-W>k]], buffer = 0, mode = "t", noremap = true },
      { "<C-l>", [[<C-\><C-n><C-W>l]], buffer = 0, mode = "t", noremap = true },
      {
        "<leader>ton",
        '<cmd>lua _TERM_TOGGLE("node")<cr>',
        desc = "Open Node Terminal",
        mode = "n",
        silent = true, -- use `silent` when creating keymaps
        noremap = true, -- use `noremap` when creating keymaps
        nowait = true, -- use `nowait` when creating keymaps
      },
      {
        "<leader>tot",
        '<cmd>lua _TERM_TOGGLE("htop")<cr>',
        desc = "Open Htop Terminal",
        mode = "n",
        silent = true, -- use `silent` when creating keymaps
        noremap = true, -- use `noremap` when creating keymaps
        nowait = true, -- use `nowait` when creating keymaps
      },
      {
        "<leader>tou",
        '<cmd>lua _TERM_TOGGLE("ncdu")<cr>',
        desc = "Open NCDU Terminal",
        mode = "n",
        silent = true, -- use `silent` when creating keymaps
        noremap = true, -- use `noremap` when creating keymaps
        nowait = true, -- use `nowait` when creating keymaps
      },
      {
        "<leader>topy",
        '<cmd>lua _TERM_TOGGLE("python")<cr>',
        desc = "Open Python Terminal",
        mode = "t",
        silent = true, -- use `silent` when creating keymaps
        noremap = true, -- use `noremap` when creating keymaps
        nowait = true, -- use `nowait` when creating keymaps
      },
      {
        "<leader>toh",
        '<cmd>lua _TERM_TOGGLE("pwsh")<cr>',
        desc = "Open Pwsh Horizontal",
        silent = true, -- use `silent` when creating keymaps
        noremap = true, -- use `noremap` when creating keymaps
        nowait = true, -- use `nowait` when creating keymaps
      },
      {
        "<leader>tobf",
        "<cmd>lua _GB_HORIZONTAL_TOGGLE()<cr>",
        desc = "Open Bash Horizontal",
        silent = true, -- use `silent` when creating keymaps
        noremap = true, -- use `noremap` when creating keymaps
        nowait = true, -- use `nowait` when creating keymaps
      },
      {
        "<leader>tnpf",
        "<cmd>lua _PS_FLOAT_TOGGLE_NEW_SESSION()<cr>",
        desc = "New Pwsh Float",
        silent = true, -- use `silent` when creating keymaps
        noremap = true, -- use `noremap` when creating keymaps
        nowait = true, -- use `nowait` when creating keymaps
      },
      {
        "<leader>tnph",
        "<cmd>lua _PS_HORIZONTAL_TOGGLE_NEW_SESSION()<cr>",
        desc = "New Pwsh Horizontal",
        silent = true, -- use `silent` when creating keymaps
        noremap = true, -- use `noremap` when creating keymaps
        nowait = true, -- use `nowait` when creating keymaps
      },
      {
        "<leader>tnpv",
        "<cmd>lua _PS_VERTICAL_TOGGLE_NEW_SESSION()<cr>",
        desc = "New Pwsh Vertical",
        silent = true, -- use `silent` when creating keymaps
        noremap = true, -- use `noremap` when creating keymaps
        nowait = true, -- use `nowait` when creating keymaps
      },
      {
        "<leader>tnbf",
        "<cmd>lua _GB_FLOAT_TOGGLE()<cr>",
        desc = "New Bash Float",
        silent = true, -- use `silent` when creating keymaps
        noremap = true, -- use `noremap` when creating keymaps
        nowait = true, -- use `nowait` when creating keymaps
      },
      {
        "<leader>tnbh",
        "<cmd>lua _GB_HORIZONTAL_TOGGLE()<cr>",
        desc = "New Bash Horizontal",
        silent = true, -- use `silent` when creating keymaps
        noremap = true, -- use `noremap` when creating keymaps
        nowait = true, -- use `nowait` when creating keymaps
      },
      {
        "<leader>tnbv",
        "<cmd>lua _GB_VERTICAL_TOGGLE()<cr>",
        desc = "New Bash Vertical",
        silent = true, -- use `silent` when creating keymaps
        noremap = true, -- use `noremap` when creating keymaps
        nowait = true, -- use `nowait` when creating keymaps
      },
    },
  },
}
