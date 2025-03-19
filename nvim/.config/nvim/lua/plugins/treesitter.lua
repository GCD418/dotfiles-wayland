return {
  "nvim-treesitter/nvim-treesitter", 
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = {"lua", "javascript", "cpp", "bash", "arduino", "hyprlang"},
      highlight = { enable = true },
      indent = { enable = true},
    })
    vim.filetype.add({
      pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
    })
  end
}
