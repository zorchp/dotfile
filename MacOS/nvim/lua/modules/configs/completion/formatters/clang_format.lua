-- return { "-style={BasedOnStyle: LLVM, IndentWidth: 4}" }
return {
	"-style={ \
        BasedOnStyle: Google, \
        IndentWidth: 4, \
        SortIncludes: false, \
        AccessModifierOffset: -4, \
        ContinuationIndentWidth: 4, \
        AlignAfterOpenBracket: true, \
        AlignOperands: true, \
        AlignTrailingComments: true, \
        MaxEmptyLinesToKeep: 2, \
        SpacesBeforeTrailingComments: 1, \
    }",
}
-- AllowShortBlocksOnASingleLine: false, \
-- KeepEmptyLinesAtTheStartOfBlocks: true \
-- AllowShortFunctionsOnASingleLine: false, \
-- AllowShortIfStatementsOnASingleLine: false, \
-- AllowShortLoopsOnASingleLine: false, \
-- AllowShortCaseLabelsOnASingleLine: false, \
