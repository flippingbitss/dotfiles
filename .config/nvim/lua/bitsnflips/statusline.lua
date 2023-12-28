require("lualine").setup {
    options = {
        theme = "gruvbox",
        icons = false,
        component_separators = "",
        section_separators = "",
    },
    sections = {
        lualine_b = {"branch", "diagnostics"},
        lualine_x = {"encoding", "filetype"}
    }
}
