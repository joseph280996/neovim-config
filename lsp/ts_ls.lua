local common_config = {
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
    baseIndentSize = 4,
    tabSize = 4,
    convertTabsToSpaces = false,
    insertSpaceAfterCommaDelimiter = true,
    insertSpaceAfterFunctionKeywordForAnonymousFunctions = true,
    insertSpaceAfterKeywordsInControlFlowStatements = true,
    insertSpaceAfterOpeningAndBeforeClosingJsxExpressionBraces = true,
    insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces = true,
    insertSpaceAfterOpeningAndBeforeClosingNonemptyBrackets = true,
    insertSpaceAfterSemicolonInForStatements = true,
    insertSpaceBeforeAndAfterBinaryOperators = true,
    semicolons = "insert",
    trimTrailingWhitespace = true,
    newLineCharacter = "\n",
  },
}
return {
  filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascriptreact", "javascript" },
  init_options = {
    preferences = {
      quotePreference = "double",
    },
  },
  settings = {
    javascript = common_config,
    typescript = common_config,
  },
}
