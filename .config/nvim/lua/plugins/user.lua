---@type LazySpec
return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {},
  },
  {
    "https://github.com/fresh2dev/zellij.vim",
    tag = "0.4.0",
    lazy = false,
    init = function()
      vim.g.zelli_navigator_move_focus_or_tab = 1
      vim.g.zellij_navigator_no_default_mappings = 1
    end,
  },
}
