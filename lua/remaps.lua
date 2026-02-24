vim.keymap.set("n", "<C-n>", ":Neotree filesystem toggle<CR>", { noremap = true, silent = true })
vim.opt.clipboard = "unnamedplus" -- Syncs clipboard with yank buffer so "p" does the same as "ctrl+v"
vim.keymap.set("n", "<Leader>ff", require("telescope.builtin").find_files, {})
vim.keymap.set("n", "<Leader>fg", require("telescope.builtin").live_grep, {})
