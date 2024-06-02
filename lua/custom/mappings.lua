---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    --  format with conform
    ["<leader>fm"] = {
      function()
        require("conform").format()
      end,
      "formatting",
      },
    -- extra Telescope mappings
    ["<leader>fd"] = { "<cmd> Telescope lsp_definitions <CR>", "Goto to definition" },
    ["<leader>fs"] = { "<cmd> Telescope lsp_document_symbols <CR>", "Show document symbols" },
    ["<leader>fg"] = { "<cmd> Telescope lsp_references<CR>", "Show all occurrences" },
  },

  v = {
    [">"] = { ">gv", "indent"},
   },
}

-- more keybinds!

return M
