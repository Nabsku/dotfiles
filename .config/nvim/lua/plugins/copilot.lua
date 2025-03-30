return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  event = "BufReadPost",
  opts = {
    suggestion = {
      auto_trigger = true,
      keymap = {
        accept = false, -- handled by completion engine
      },
    },
    copilot_model = "gpt-4o-copilot",
    filetypes = {
      markdown = true,
      gitcommit = true,
      gitrebase = true,
      help = true,
      text = true,
      yaml = true,
      json = true,
      go = true,
      javascript = true,
      typescript = true,
      sh = function()
        if string.match(vim.fs.basename(vim.api.nvim_buf_get_name(0)), "^%.env.*") then
          -- disable for .env files
          return false
        end
        return true
      end,
    },
  },
  specs = {
    {
      "AstroNvim/astrocore",
      opts = {
        options = {
          g = {
            -- set the ai_accept function
            ai_accept = function()
              if require("copilot.suggestion").is_visible() then
                require("copilot.suggestion").accept()
                return true
              end
            end,
          },
        },
      },
    },
  },
}
