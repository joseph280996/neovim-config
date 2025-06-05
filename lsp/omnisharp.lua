local function get_omnisharp_cmd()
  return vim.fn.stdpath("data") .. "/mason/packages/omnisharp/omnisharp"
end

local function get_root_dir()
  return vim.fs.dirname(
    vim.fs.find({ ".gitignore", ".git", "*.sln", ".editorconfig" }, { upward = false })[1]
  )
end

local function get_cmd()
  local omnisharp_cmd = get_omnisharp_cmd()
  local root_dir = get_root_dir()

  return {
    omnisharp_cmd,
    "-s",
    root_dir,
    "--hostPID",
    tostring(vim.fn.getpid()),
    "--encoding",
    "utf-8",
    "--languageserver",
  }
end

return {
  cmd = get_cmd(),
  settings = {
    MSBuild = {
      enable = true,
    },
    FormattingOptions = {
      EnableEditorConfigSupport = true,
      OrganizeImports = true,
      NewLine = "\n",
      UseTabs = false,
      TabSize = 4,
      IndentationSize = 4,
      SpacingAfterMethodDeclarationName = false,
      SpaceWithinMethodDeclarationParenthesis = false,
      SpaceBetweenEmptyMethodDeclarationParentheses = false,
      SpaceAfterMethodCallName = false,
      SpaceWithinMethodCallParentheses = false,
      SpaceBetweenEmptyMethodCallParentheses = false,
      SpaceAfterControlFlowStatementKeyword = false,
      SpaceWithinExpressionParentheses = false,
      SpaceWithinCastParentheses = false,
      SpaceWithinOtherParentheses = false,
      SpaceAfterCast = false,
      SpacesIgnoreAroundVariableDeclaration = false,
      SpaceBeforeOpenSquareBracket = false,
      SpaceBetweenEmptySquareBrackets = false,
      SpaceWithinSquareBrackets = false,
      SpaceAfterColonInBaseTypeDeclaration = false,
      SpaceAfterComma = false,
      SpaceAfterDot = false,
      SpaceAfterSemicolonsInForStatement = false,
      SpaceBeforeColonInBaseTypeDeclaration = false,
      SpaceBeforeComma = false,
      SpaceBeforeDot = false,
      SpaceBeforeSemicolonsInForStatement = false,
      SpacingAroundBinaryOperator = "single",
      IndentBraces = false,
      IndentBlock = false,
      IndentSwitchSection = false,
      IndentSwitchCaseSection = false,
      IndentSwitchCaseSectionWhenBlock = false,
      LabelPositioning = "oneLess",
      WrappingPreserveSingleLine = false,
      WrappingKeepStatementsOnSingleLine = false,
      NewLinesForBracesInTypes = false,
      NewLinesForBracesInMethods = false,
      NewLinesForBracesInProperties = false,
      NewLinesForBracesInAccessors = false,
      NewLinesForBracesInAnonymousMethods = false,
      NewLinesForBracesInControlBlocks = false,
      NewLinesForBracesInAnonymousTypes = false,
      NewLinesForBracesInObjectCollectionArrayInitializers = false,
      NewLinesForBracesInLambdaExpressionBody = false,
      NewLineForElse = false,
      NewLineForCatch = false,
      NewLineForFinally = false,
      NewLineForMembersInObjectInit = false,
      NewLineForMembersInAnonymousTypes = false,
      NewLineForClausesInQuery = false,
    },
    RoslynExtensionOptions = {
      enableDecompilationSupport = true,
    },
  },
}
