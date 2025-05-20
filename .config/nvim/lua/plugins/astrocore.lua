---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 },
      autopairs = true,
      cmp = true,
      diagnostics = { virtual_text = false, virtual_lines = true },
      highlighturl = true,
      notifications = true,
    },
    diagnostics = {
      virtual_text = false,
      underline = true,
    },
    options = {
      opt = {
        relativenumber = true,
        number = true,
        spell = true,
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = false,
      },
      g = {},
    },
    mappings = {
      n = {
        ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },
      },
    },
  },
}
