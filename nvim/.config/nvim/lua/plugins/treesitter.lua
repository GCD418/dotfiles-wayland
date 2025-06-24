return {
  "nvim-treesitter/nvim-treesitter", 
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = { "cpp", "c", "lua", "vim", "vimdoc", "query" },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true},
    })
    vim.filetype.add({
      pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
    })
  end
}
