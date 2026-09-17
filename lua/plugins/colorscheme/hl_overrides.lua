local getColors = function(C)
  local U = require("catppuccin.utils.colors")

  return {
    state = {
      error = C.red,
      warning = C.yellow,
      info = C.sky,
      hint = C.teal,
      ok = C.green,
      conflict = C.maroon,
    },
    git = {
      add = C.green,
      change = C.peach,
      delete = C.red,
      stage = U.darken(C.green, 0.5, C.base),
      info = C.blue,
      ancestor = C.text,
      ignored = C.overlay0,
    },
    float = {
      bg = C.base,
      blockBg = C.mantle,
      blockBorderBg = C.mantle,
      blockBorderFg = C.mantle,
      borderBg = C.base,
      borderFg = C.blue,
    },
    separator = {
      bg = C.base,
      fg = C.mantle,
    },
  }
end

local get_extra_hl = function(C)
  local U = require("catppuccin.utils.colors")
  local floatColors = getColors(C).float
  local result = {}

  return vim.tbl_deep_extend("force", result, {
    -- oil.nvim
    OilMtime = { fg = "#8383A9" },
    OilSize = { fg = "#87FF87" },
    OilRead = { fg = C.mauve },
    OilWrite = { fg = "#FD86D5" },
    OilExecute = { fg = C.teal },
    OilHyphen = { fg = C.red },

    -- snacks.nvim
    SnacksIndentScope = { fg = "#6C7087" },
    SnacksIndentChunk = { link = "SnacksIndent" },
    SnacksIndentBlank = { link = "SnacksIndent" },
    SnacksNormal = { link = "Normal" },
    SnacksNormalNC = { link = "Normal" },
    -- TODO: bug, space without HL in snacks Input
    SnacksInputTitle = { link = "FloatTitle" },
    SnacksPickerMatch = { fg = C.blue, bg = U.darken(C.blue, 0.095, C.base) },
    SnacksTermFloatBorder = { bg = floatColors.borderBg, fg = floatColors.borderBg },
    SnacksPickerFloatBorder = { fg = floatColors.borderBg, bg = floatColors.borderBg },

    -- grug-far.nvim
    GrugFarResultsMatch = { default = true, link = "DiffChange" },
    GrugFarResultsMatchAdded = { default = true, link = "DiffAdd" },
    GrugFarResultsMatchRemoved = { default = true, link = "DiffDelete" },

    -- bufferline.nvim
    BufferLineOffset = { bg = C.mantle, fg = C.lavender },
    DevIconDimmed = { fg = C.surface1, bg = C.base },

    -- highlight-undo.nvim
    Highlight = {
      fg = "NONE",
      bg = C.surface1,
    },

    -- yanky.nvim
    YankyPut = {
      fg = "NONE",
      bg = C.surface1,
    },
    YankyYanked = {
      link = "YankyPut",
    },

    -- blink.cmp
    BlinkCmpKindAvante = { fg = C.teal },
    BlinkCmpKindCodeium = { fg = C.teal },
    BlinkCmpKindCopilot = { fg = C.teal },
    BlinkCmpKindDap = { fg = C.red },
    BlinkCmpKindHistory = { fg = C.rosewater },
    BlinkCmpKindPackage = { fg = C.blue },
    BlinkCmpKindRenderMarkdown = { fg = C.blue },
    BlinkCmpKindSpell = { fg = C.yellow },
    BlinkCmpKindTabNine = { fg = C.teal },

    BlinkCmpSource = { fg = C.subtext0 },
    BlinkCmpLabel = { fg = C.text },
    BlinkCmpLabelDeprecated = { fg = C.surface1 },
    BlinkCmpLabelDescription = { fg = C.overlay0 },
    BlinkCmpLabelDetail = { fg = C.overlay0 },
    BlinkCmpLabelMatch = { fg = C.blue, bold = true },
    BlinkCmpMenuBorder = { bg = floatColors.borderBg, fg = floatColors.borderFg },
    BlinkCmpDoc = { bg = floatColors.bg },
    BlinkCmpDocBorder = { bg = floatColors.borderBg, fg = floatColors.borderFg },
    BlinkCmpDocSeparator = { bg = floatColors.borderBg, fg = C.teal },
    BlinkCmpSignatureHelp = { bg = floatColors.bg },
    BlinkCmpSignatureHelpBorder = { bg = floatColors.borderBg, fg = floatColors.borderFg },

    -- nvim pmenu
    -- PmenuSel = { link = "CursorLine" },
    PmenuSel = { bg = U.darken(C.blue, 0.64, C.base) },
    Pmenu = { bg = floatColors.bg },
    PmenuThumb = { bg = floatColors.borderFg },
    PmenuSbar = { bg = "NONE" },
  })
end

local get_overrides_hl = function(C)
  local U = require("catppuccin.utils.colors")
  local stateColors = getColors(C).state
  local floatColors = getColors(C).float
  local separatorColors = getColors(C).separator

  return {
    -- syntax
    ["@variable"] = { link = "Variable" },
    Todo = { fg = C.blue, bg = C.base },
    Error = { fg = C.red, bg = "NONE" }, -- (preferred) any erroneous construct

    -- flash.nvim
    FlashPrompt = { link = "NoiceCmdline" },
    FlashPromptMode = { link = "NoiceCmdlineIconSearch" },

    -- trouble.nvim
    TroubleNormal = { bg = C.base },
    TroubleNormalNC = { bg = C.base },

    -- noice.nvim
    NoiceCmdline = { bg = C.base, fg = C.text },
    NoiceCmdlinePopupNormal = { fg = C.text, bg = floatColors.blockBorderBg },
    NoiceCmdlinePopupBorder = { fg = floatColors.blockBorderFg, bg = floatColors.blockBorderBg },
    NoiceConfirm = { fg = C.text, bg = floatColors.blockBorderBg },
    NoiceConfirmBorder = { fg = floatColors.blockBorderFg, bg = floatColors.blockBorderBg },
    NoiceSplit = { link = "Normal" },
    NoiceSplitBorder = { link = "FloatBorder" },
    NoiceMini = { link = "Comment" },
    NoiceVirtualText = {
      fg = U.darken(C.sky, 0.90, C.base),
      bg = U.darken(U.darken(C.sky, 0.90, C.base), 0.095, C.base),
    },

    -- which-key.nvim
    WhichKey = { bg = floatColors.blockBg, fg = C.text },
    WhichKeyNormal = { link = "WhichKey" },
    WhichKeyBorder = { bg = floatColors.blockBorderBg, fg = floatColors.blockBorderFg },

    -- nvim-treesitter-context
    TreesitterContext = { fg = C.surface1, bg = C.base },
    TreesitterContextLineNumber = { link = "LineNr" },
    TreesitterContextBottom = { style = {} },

    -- nvim spelling
    SpellBad = { sp = stateColors.error, undercurl = true }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    SpellCap = { sp = stateColors.warning, undercurl = true }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    SpellLocal = { sp = stateColors.info, undercurl = true }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    SpellRare = { sp = stateColors.hint, undercurl = true }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.

    -- nvim diagnostics
    ErrorMsg = { fg = stateColors.error }, -- error messages on the command line
    DiagnosticUnderlineError = { undercurl = true, sp = stateColors.error }, -- Used to underline "Error" diagnostics
    DiagnosticUnderlineWarn = { undercurl = true, sp = stateColors.warning }, -- Used to underline "Warning" diagnostics
    DiagnosticUnderlineInfo = { undercurl = true, sp = stateColors.info }, -- Used to underline "Information" diagnostics
    DiagnosticUnderlineHint = { undercurl = true, sp = stateColors.hint }, -- Used to underline "Hint" diagnostics
    DiagnosticError = { fg = stateColors.error }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticWarn = { fg = stateColors.warning }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticInfo = { fg = stateColors.info }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticHint = { fg = stateColors.hint }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticUnnecessary = { fg = U.darken(C.text, 0.667, C.base), undercurl = true, link = nil },
    DiagnosticFloatingError = { fg = stateColors.error }, -- Used to color "Error" diagnostic messages in diagnostics float
    DiagnosticFloatingWarn = { fg = stateColors.warning }, -- Used to color "Warn" diagnostic messages in diagnostics float
    DiagnosticFloatingInfo = { fg = stateColors.info }, -- Used to color "Info" diagnostic messages in diagnostics float
    DiagnosticFloatingHint = { fg = stateColors.hint }, -- Used to color "Hint" diagnostic messages in diagnostics float
    DiagnosticVirtualTextError = { fg = stateColors.error, bg = "NONE" },
    DiagnosticVirtualTextHint = { fg = stateColors.hint, bg = "NONE" },
    DiagnosticVirtualTextInfo = { fg = stateColors.info, bg = "NONE" },
    DiagnosticVirtualTextWarn = { fg = stateColors.warning, bg = "NONE" },
    -- TODO: add DiagnosticVirtualLines...?

    -- nvim float windows
    FloatTitle = { bg = floatColors.bg, fg = floatColors.borderFg },
    NormalFloat = { bg = floatColors.bg },
    FloatBorder = { bg = floatColors.borderBg, fg = floatColors.borderFg },

    -- nvim separators
    WinSeparator = separatorColors,
    VertSplit = separatorColors,

    -- nvim-lsp-endhints
    LspInlayHint = {
      fg = C.surface1,
      bg = U.darken(C.surface1, 0.095, C.base),
    },

    -- nvim recording macro msg
    ModeMsg = {
      fg = C.peach,
    },

    -- nvim fold
    FoldColumn = { bg = C.base }, -- sign column
    Folded = { bg = "NONE" }, -- folded line

    -- nvim snippets
    SnippetTabstop = { bg = U.darken(C.surface1, 0.7, C.base) },

    -- nvim lsp
    LspReferenceText = { bg = U.darken(C.surface1, 0.7, C.base), underline = false },
    LspReferenceRead = { link = "LspReferenceText" },
    LspReferenceWrite = { link = "LspReferenceText" },
  }
end

local get_theme_overrides_hl = function(C)
  local extra_hl = get_extra_hl(C)
  local overrides_hl = get_overrides_hl(C)
  return vim.tbl_deep_extend("force", extra_hl, overrides_hl)
end

return {
  latte = get_theme_overrides_hl,
  frappe = get_theme_overrides_hl,
  macchiato = get_theme_overrides_hl,
  mocha = get_theme_overrides_hl,
}
