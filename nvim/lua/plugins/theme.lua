return { 
    "rebelot/kanagawa.nvim",
    name = "kanagawa", 
    priority = 1000,
    theme = "wave",              -- Load "wave" theme when 'background' option is not set
    background = {               -- map the value of 'background' option to a theme
        dark = "wave",           -- try "dragon" !
        light = "lotus"
    },
    config = function()
        vim.cmd.colorscheme("kanagawa")
    end
}