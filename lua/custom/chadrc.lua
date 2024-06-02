---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "nightfox",
  theme_toggle = { "nightfox", "one_light" },
  hl_override = {
    CursorLine = {
        bg = "#000000"--"black"--"one_bg",
    },
  },
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
