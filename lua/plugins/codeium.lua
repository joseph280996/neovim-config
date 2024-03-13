return {
  --[[ "Exafunction/codeium.vim",
  event = "BufEnter",
  config = function()
    local wk = require("which-key")
    vim.g.codeium_no_map_tab = false

    wk.register({
      s = {
        name = "Codeium Suggestion",
        a = { "<cmd> codeium#Accept()<cr>", "Accept suggestion" },
        b = { "<cmd> codeium#CycleCompletions(1)<cr>", "Cycle backward" },
        f = { "<cmd> codeium#CycleCompletions(-1)<cr>", "Cycle forward" },
        c = { "<cmd> codeium#Clear()<cr>", "Clear Suggestions" },
      },
    })
  end, ]]
}
