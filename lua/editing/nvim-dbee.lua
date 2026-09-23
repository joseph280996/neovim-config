local KEYBINDING_OPTS = require("utils.constants").KEYBINDING_OPTS

return {
  "kndndrj/nvim-dbee",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  build = function()
    -- Install tries to automatically detect the install method.
    -- if it fails, try calling it with one of these parameters:
    --    "curl", "wget", "bitsadmin", "go"
    require("dbee").install()
  end,
  config = function()
    -- Kerberos: the dbee binary's Go krb5 client reads only FILE-format ccaches, but macOS
    -- Heimdal defaults to "API:" (a daemon-held cache with no path on disk), so a plain
    -- `kinit` leaves nothing on disk for dbee to read. This build also has no /etc/krb5.conf
    -- to fall back on. Both the conf and a FILE ccache are passed explicitly in the URL below.
    -- One-time:
    --   mkdir -p ~/.local/state/krb5
    -- Whenever the ticket expires:
    --   kinit -c FILE:$HOME/.local/state/krb5/castle.ccache tpham4@EZESOFT.NET
    --   klist -c FILE:$HOME/.local/state/krb5/castle.ccache   # confirm it landed
    -- Deliberately not /tmp: com.apple.tmp_cleaner deletes files there after 3 days.
    local function castle_url(host)
      return "sqlserver://tpham4@"
        .. host
        .. "?multisubnetfailover=true"
        .. "&authenticator=krb5"
        .. "&krb5-realm=EZESOFT.NET"
        .. "&krb5-configfile="
        .. vim.fn.expand("~/.config/krb5/castle.conf")
        .. "&krb5-credcachefile="
        .. vim.fn.expand("~/.local/state/krb5/castle.ccache")
    end

    require("dbee").setup({
      sources = {
        require("dbee.sources").MemorySource:new({
          {
            name = "Castle02",
            type = "sqlserver",
            url = castle_url("CASTLEL02.awsdev.ezesoftcloud.com"),
          },
          {
            name = "Castle05",
            type = "sqlserver",
            url = castle_url("CASTLEL05.awsdev.ezesoftcloud.com"),
          },
        }),
        -- Allows adding/editing more connections interactively from DBee's UI
        -- (persists across restarts).
        require("dbee.sources").FileSource:new(vim.fn.stdpath("cache") .. "/dbee/persistence.json"),
      },
    })
  end,
  keys = {
    vim.tbl_deep_extend("force", {
      "<leader>Do",
      "<cmd>lua require('dbee').open()<cr>",
      desc = "Open DBee",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<leader>Dc",
      "<cmd>lua require('dbee').close()<cr>",
      desc = "Close DBee",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<leader>Dt",
      "<cmd>lua require('dbee').toggle()<cr>",
      desc = "Toggle DBee",
    }, KEYBINDING_OPTS),
  },
}
