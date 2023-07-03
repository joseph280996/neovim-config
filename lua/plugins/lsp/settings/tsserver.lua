-- Function to update import on file rename
local function rename_file()
  local source_file, target_file
  
  vim.ui.input({
    prompt = "Source: ",
    completion = "file",
    default = vim.api.nvim_buf_get_name(0)
  },
    function(input)
      source_file = input
    end
  )
  vim.ui.input({
    prompt = "Target: ",
    completion = "file",
    default = source_file
  },
    function(input)
      target_file = input
    end
  )

  local params = {
    command = "_typescript.applyRenameFile",
    arguments = {
      {
        sourceUri = source_file,
        targetUri = target_file,
      },
    },
    title = ""
  }

  vim.lsp.util.rename(source_file, target_file)
  vim.lsp.buf.execute_command(params)
end

return {
    settings = {
        quotePreference = "double",
        javascript = {
            inlayHints = {
                includeInlayEnumMemberValueHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
                includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayVariableTypeHints = true,
            },
            format = {
                convertTabsToSpaces = false,
                insertSpaceAfterCommaDelimiter = true,
                insertSpaceAfterFunctionKeywordForAnonymousFunctions = true,
                insertSpaceAfterKeywordsInControlFlowStatements = true,
                insertSpaceAfterOpeningAndBeforeClosingJsxExpressionBraces = true,
                insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces = true,
                insertSpaceAfterOpeningAndBeforeClosingNonemptyBrackets = true,
                insertSpaceAfterSemicolonInForStatements = true,
                insertSpaceBeforeAndAfterBinaryOperators = true,
                semicolons = 'insert',
                trimTrailingWhitespace = true,
                newLineCharacter = '\n'
            }
        },
        typescript = {
            inlayHints = {
                includeInlayEnumMemberValueHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
                includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayVariableTypeHints = true,
            },
            format = {
                convertTabsToSpaces = false,
                insertSpaceAfterCommaDelimiter = true,
                insertSpaceAfterFunctionKeywordForAnonymousFunctions = true,
                insertSpaceAfterKeywordsInControlFlowStatements = true,
                insertSpaceAfterOpeningAndBeforeClosingJsxExpressionBraces = true,
                insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces = true,
                insertSpaceAfterOpeningAndBeforeClosingNonemptyBrackets = true,
                insertSpaceAfterSemicolonInForStatements = true,
                insertSpaceBeforeAndAfterBinaryOperators = true,
                semicolons = 'insert',
                trimTrailingWhitespace = true,
                newLineCharacter = '\n'
            }
        },
    },
}
