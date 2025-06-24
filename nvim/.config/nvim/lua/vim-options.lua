vim.cmd [[
highlight Normal guibg=none
highlight NonText guibg=none
highlight Normal ctermbg=none
highlight NonText ctermbg=none
]]


vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

vim.wo.relativenumber = true

-- Better diagnostic signs
--vim.fn.sign_define("DiagnosticSignError", {text = "●", texthl = "DiagnosticSignError"})
--vim.fn.sign_define("DiagnosticSignWarn", {text = "●", texthl = "DiagnosticSignWarn"})
--vim.fn.sign_define("DiagnosticSignInfo", {text = "●", texthl = "DiagnosticSignInfo"})
--vim.fn.sign_define("DiagnosticSignHint", {text = "●", texthl = "DiagnosticSignHint"})

-- C++ specific settings
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "cpp",
--   callback = function()
--     vim.opt_local.tabstop = 4
--     vim.opt_local.shiftwidth = 4
--     vim.opt_local.softtabstop = 4
--     vim.opt_local.expandtab = true
--     -- Enable line numbers for competitive programming
--     vim.opt_local.number = true
--   end,
-- })
--
-- -- Show diagnostic messages on cursor hold
-- vim.api.nvim_create_autocmd("CursorHold", {
--   callback = function()
--     vim.diagnostic.open_float(nil, {
--       focusable = false,
--       close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
--       border = 'rounded',
--       source = 'always',
--       prefix = ' ',
--       scope = 'cursor',
--     })
--   end
-- })
--
-- -- Reduce updatetime for faster diagnostics
-- vim.opt.updatetime = 300
