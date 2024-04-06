local get_value_on_os = require("user.utils.get-values-on-os")

return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {
    size = 20,
    open_mapping = [[<c-\>]],
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
    local toggleterm = require("toggleterm")

    toggleterm.setup(opts)

    vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

    local Terminal = require("toggleterm.terminal").Terminal
    local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

    function _LAZYGIT_TOGGLE()
      lazygit:toggle()
    end

    local node = Terminal:new({ cmd = "node", hidden = true })

    function _NODE_TOGGLE()
      node:toggle()
    end

    local ncdu = Terminal:new({ cmd = "ncdu", hidden = true })

    function _NCDU_TOGGLE()
      ncdu:toggle()
    end

    local htop = Terminal:new({ cmd = "htop", hidden = true })

    function _HTOP_TOGGLE()
      htop:toggle()
    end

    local python = Terminal:new({ cmd = "python", hidden = true })

    function _PYTHON_TOGGLE()
      python:toggle()
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
    ["<leader>t"] = {
      desc = "Terminal",
      o = {
        desc = "Open",
        n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
        t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
        u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
        P = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
        f = { "<cmd>lua _PS_FLOAT_TOGGLE()<cr>", "Float" },
        h = { "<cmd>lua _PS_HORIZONTAL_TOGGLE()<cr>", "Horizontal" },
        v = { "<cmd>lua _PS_VERTICAL_TOGGLE()<cr>", "Vertical" },
        p = {
          name = "Powershell",
          f = { "<cmd>lua _PS_FLOAT_TOGGLE()<cr>", "Float" },
          h = { "<cmd>lua _PS_HORIZONTAL_TOGGLE()<cr>", "Horizontal" },
          v = { "<cmd>lua _PS_VERTICAL_TOGGLE()<cr>", "Vertical" },
        },
        b = {
          name = "Bash",
          f = { "<cmd>lua _GB_FLOAT_TOGGLE()<cr>", "Float" },
          h = { "<cmd>lua _GB_HORIZONTAL_TOGGLE()<cr>", "Horizontal" },
          v = { "<cmd>lua _GB_VERTICAL_TOGGLE()<cr>", "Vertical" },
        },
      },
      n = {
        name = "New",
        f = { "<cmd>lua _PS_FLOAT_TOGGLE_NEW_SESSION()<cr>", "Float" },
        h = { "<cmd>lua _PS_HORIZONTAL_TOGGLE_NEW_SESSION()<cr>", "Horizontal" },
        v = { "<cmd>lua _PS_VERTICAL_TOGGLE_NEW_SESSION()<cr>", "Vertical" },
        p = {
          name = "Powershell",
          f = { "<cmd>lua _PS_FLOAT_TOGGLE_NEW_SESSION()<cr>", "Float" },
          h = { "<cmd>lua _PS_HORIZONTAL_TOGGLE_NEW_SESSION()<cr>", "Horizontal" },
          v = { "<cmd>lua _PS_VERTICAL_TOGGLE_NEW_SESSION()<cr>", "Vertical" },
        },
        b = {
          name = "Bash",
          f = { "<cmd>lua _GB_FLOAT_TOGGLE()<cr>", "Float" },
          h = { "<cmd>lua _GB_HORIZONTAL_TOGGLE()<cr>", "Horizontal" },
          v = { "<cmd>lua _GB_VERTICAL_TOGGLE()<cr>", "Vertical" },
        },
      },
    },
  },
}
