return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    -- require("nvim-treesitter").install({ "rust", "javascript", "lua" }),
    -- require('nvim-treesitter').install({'lua', 'javascript'})
}
