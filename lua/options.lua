vim.opt.number = true
-- Use 4 spaces for indentation and expand tabs to spaces
-- vim.opt.tabstop = 4         -- A tab character is displayed as 4 spaces
-- vim.opt.shiftwidth = 4      -- Indentation amount used by autoindent and Shift operations (like >> or ==)
-- vim.opt.softtabstop = 4     -- Number of spaces a <Tab> counts for in Insert mode
-- vim.opt.expandtab = true    -- Use spaces whenever a tab is expected (turns tabs into spaces)
-- vim.opt.autoindent = true   -- Copy the indentation from the previous line
-- vim.opt.smartindent = true  -- Smartly indent for C-like languages
vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.expandtab = true
  end,
})
