
--- @enum FixAllScope
local scope = {
  Document = 0,
  Project = 1,
  Solution = 2,
}

local structlog = require("structlog")
structlog.configure({
    csharp_logger = {
      pipelines = {
        {
          level = structlog.level.TRACE,
          processors = {
            structlog.processors.StackWriter({ "line", "file" }, { max_parents = 3 }),
            structlog.processors.Timestamper("%H:%M:%S"),
            function(log)
              log["buffer"] = vim.api.nvim_get_current_buf()
              return log
            end,
          },
          formatter = structlog.formatters.Format( --
            "%s [%s] %s: %-30s buffer=%s",
            { "timestamp", "level", "logger_name", "msg", "buffer" }
          ),
          sink = structlog.sinks.File(vim.fn.stdpath("log") .. "/csharp.log"),
        },
      },
    },
  })

local function log(level, message, data)
  local logger = require("structlog").get_logger("csharp_logger")
  if logger == nil or vim.log.levels[level] < vim.log.levels["INFO"] then
    return
  end

  logger:log(vim.log.levels[level] + 1, message, data)
end

local function omnisharp_text_changes_to_text_edits(changes)
  local textEdits = {}
  for _, change in pairs(changes) do
    local textEdit = {
      newText = change.NewText,
      range = {
        start = {
          line = change.StartLine,
          character = change.StartColumn,
        },
        ["end"] = {
          line = change.EndLine,
          character = change.EndColumn,
        },
      },
    }

    table.insert(textEdits, textEdit)
  end

  return textEdits
end

--- @param bufnr number
--- @return table|nil
local function get_omnisharp_client(bufnr)
  local clients = vim.lsp.get_clients({ bufnr = bufnr })
  for _, client in ipairs(clients) do
    if client.name == "omnisharp" then
      return client
    end
  end
end

local function handle_run_fix_all(_, response, _)
  local workspace_edits = { changes = {} }

  for _, change in pairs(response.Changes) do
    if change.ModificationType ~= 0 then
      log("ERROR","Unsupported modification type.", { feature = "fix-all", change = change })
      goto continue
    end

    local file_uri = vim.uri_from_fname(change.FileName)
    local text_edits = omnisharp_text_changes_to_text_edits(change.Changes)
    workspace_edits.changes[file_uri] = text_edits

    ::continue::
  end

  vim.lsp.util.apply_workspace_edit(workspace_edits, "utf-8")
end

local function run_fix_all(omnisharp_client, buffer, params)
  local request = {
    FileName = params.fileName,
    Scope = params.scope,
    FixAllFilter = params.items,
    WantsAllCodeActionOperations = true,
    WantsTextChanges = true,
    ApplyChanges = false,
  }

  log("INFO","Sending runfixall request to LSP Server", { feature = "fix-all", request = request })
  omnisharp_client.request("o#/runfixall", request, handle_run_fix_all, buffer)
end

local function handle_get_fix_all(omnisharp_client)
  return function (_, response, ctx)
    vim.ui.select(response.Items, {
      prompt = "Fix All:",
      format_item = function(item)
        return item.Id .. ": " .. item.Message
      end,
    }, function(choice, _)
        local params = { items = { choice }, scope = ctx.params.Scope, fileName = ctx.params.FileName }
        run_fix_all(omnisharp_client, ctx.bufnr, params)
      end)
  end
end

local function execute(params)
  if not scope[params.scope] then
    log("ERROR", "Invalid scope. Scope must be Document, Project or Solution", { feature = "fix-all", })
    return
  end

  local buffer = vim.api.nvim_get_current_buf()
  local omnisharp_client = get_omnisharp_client(buffer)

  if omnisharp_client == nil then
    log("ERROR", "Omnisharp isn't attached to buffer.", { feature = "fix-all", })
    return
  end

  local position_params = vim.lsp.util.make_position_params(1000, "utf-8")

  local request = {
    Column = position_params.position.character,
    Line = position_params.position.line,
    FileName = vim.uri_to_fname(position_params.textDocument.uri),
    Scope = params.scope,
  }

  log("INFO", "Sending getfixall request to LSP Server", { feature = "fix-all", request = request, })
  omnisharp_client.request("o#/getfixall", request, handle_get_fix_all(omnisharp_client), buffer)
end

local function select_scope_and_execute()
  vim.ui.select({ "Document", "Project", "Solution" }, { prompt = "Fix All:" }, function(selected)
    if selected then
      execute({ scope = selected })
    end
  end)
end

vim.keymap.set("n", "<leader>lfa", select_scope_and_execute, { buffer = true, silent = true, noremap = true, desc = "Fix All"})
