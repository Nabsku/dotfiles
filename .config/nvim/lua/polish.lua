require("copilot").setup {
  should_attach = function(_, bufname)
    if string.match(bufname, "env") then return false end

    return true
  end,
}
