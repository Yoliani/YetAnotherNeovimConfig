local M = {}

M.nightfox = function()
    local nightfox = require("nightfox")

    -- This function set the configuration of nightfox. If a value is not passed in the setup function
    -- it will be taken from the default configuration above
    nightfox.setup(
        {
            fox = "duskfox", -- change the colorscheme to use nordfox
            styles = {
                comments = "italic", -- change style of comments to be italic
                keywords = "bold", -- change style of keywords to be bold
                functions = "italic,bold" -- styles can be a comma separated list
            },
            inverse = {
                match_paren = true -- inverse the highlighting of match_parens
            },
            colors = {
                red = "#FF000", -- Override the red color for MAX POWER
                bg_alt = "#000000"
            },
            hlgroups = {
                TSPunctDelimiter = {fg = "${red}"}, -- Override a highlight group with the color red
                LspCodeLens = {bg = "#000000", style = "italic"}
            }
        }
    )

    -- Load the configuration set above and apply the colorscheme
    nightfox.load()
end

M.catppuccino = function()
    local catppuccino = require("catppuccin")

    -- configure it
    catppuccino.setup(
        {
            transparent_background = false,
            term_colors = true,
            styles = {
                comments = "italic",
                functions = "italic",
                keywords = "italic",
                strings = "bold",
                variables = "NONE"
            },
            integrations = {
                treesitter = true,
                native_lsp = {
                    enabled = true,
                    virtual_text = {
                        errors = "italic",
                        hints = "italic",
                        warnings = "italic",
                        information = "italic"
                    },
                    underlines = {
                        errors = "underline",
                        hints = "underline",
                        warnings = "underline",
                        information = "underline"
                    }
                },
                lsp_trouble = true,
                lsp_saga = true,
                gitgutter = false,
                gitsigns = true,
                telescope = true,
                nvimtree = {
                    enabled = true,
                    show_root = true
                },
                which_key = true,
                indent_blankline = {
                    enabled = true,
                    colored_indent_levels = true
                },
                dashboard = true,
                neogit = false,
                vim_sneak = false,
                fern = false,
                barbar = false,
                bufferline = true,
                markdown = true,
                lightspeed = true,
                ts_rainbow = true,
                hop = false,
                cmp = true
            }
        }
    )
    local api = require("catppuccin.api.colors")
    local colors = api.get_colors()
    vim.cmd([[colorscheme catppuccin ]])
end

M.material = function()
    vim.g.material_style = "palenight"
    require("material").setup(
        {
            contrast = true, -- Enable contrast for sidebars, floating windows and popup menus like Nvim-Tree
            borders = false, -- Enable borders between verticaly split windows
            popup_menu = "palenight", -- Popup menu style ( can be: 'dark', 'light', 'colorful' or 'stealth' )
            italics = {
                comments = false, -- Enable italic comments
                keywords = false, -- Enable italic keywords
                functions = false, -- Enable italic functions
                strings = false, -- Enable italic strings
                variables = false -- Enable italic variables
            },
            contrast_windows = {
                -- Specify which windows get the contrasted (darker) background
                "terminal", -- Darker terminal background
                "packer", -- Darker packer background
                "qf" -- Darker qf list background
            },
            text_contrast = {
                lighter = false, -- Enable higher contrast text for lighter style
                darker = false -- Enable higher contrast text for darker style
            },
            disable = {
                background = false, -- Prevent the theme from setting the background (NeoVim then uses your teminal background)
                term_colors = false, -- Prevent the theme from setting terminal colors
                eob_lines = false -- Hide the end-of-buffer lines
            },
            custom_highlights = {} -- Overwrite highlights with your own
        }
    )
    vim.cmd([[colorscheme material]])
end
M.gruvbox_flat_style = function()
    --Gruvbox
    vim.g.gruvbox_flat_style = "dark"
    vim.cmd([[colorscheme gruvbox-flat]])
end

M.tokyonight = function()
    vim.g.tokyonight_style = "storm"
    vim.g.tokyonight_italic_functions = false
    vim.g.tokyonight_sidebars = {"qf", "vista_kind", "terminal", "packer"}
    vim.g.tokyonight_colors = {hint = "orange", error = "#ff0000"}
    vim.g.tokyonight_colors = {
        border = "#1A1B26"
    }

    vim.cmd([[colorscheme tokyonight]])
end
M.nord = function()
    vim.g.nord_contrast = false
    vim.g.nord_borders = true
    vim.g.nord_disable_background = true
    vim.g.nord_italic = false
    require("nord").set()
end

M.palenightfall = function()
    require("palenightfall").setup()
end
--
M.Vscode = function()
    vim.g.vscode_style = "dark"
    vim.cmd([[colorscheme vscode]])
end
M.Moonlight = function()
    require("moonlight").set()
end

M.onedarker = function()
    vim.cmd([[colorscheme onedarker]])
end

M.Kanagawa = function()
    require("kanagawa").setup(
        {
            undercurl = true,
            commentStyle = "italic",
            functionStyle = "NONE",
            keywordStyle = "italic",
            statementStyle = "bold",
            typeStyle = "NONE",
            specialReturn = true,
            specialException = true,
            transparent = false,
            colors = {},
            overrides = {}
        }
    )

    -- setup must be called before loading
    vim.cmd("colorscheme kanagawa")
end
M.onedark = function()
    vim.g.onedark_style = "cool"
    vim.cmd([[colorscheme onedark]])
end

M.gruvbox_baby = function()
    vim.cmd([[colorscheme gruvbox-baby]])
end

M.onedarkpro = function()
    local onedarkpro = require("onedarkpro")
    onedarkpro.setup(
        {
            plugins = {polygot = false, telescope = false},
            styles = {comments = "italic", keywords = "bold,italic"},
            options = {
                bold = true,
                italic = true,
                underline = true,
                undercurl = true,
                cursorline = true
            },
            filetype_hlgroups = {
                yaml = {TSField = {fg = "${red}"}},
                ruby = {
                    TSParameter = {fg = "${fg}"},
                    TSSymbol = {fg = "${cyan}"}
                },
                scss = {
                    TSFunction = {fg = "${cyan}"},
                    TSProperty = {fg = "${orange}"},
                    TSPunctDelimiter = {fg = "${orange}"},
                    TSType = {fg = "${red}"}
                }
            },
            hlgroups = {
                ModeMsg = {link = "LineNr"}, -- Make command line text darker
                VertSplit = {fg = "${bg}"}, -- Hide the vertical split line
                -- Highlight brackets with a custom color
                TSPunctBracket = {fg = "${brackets}"},
                TSPunctSpecial = {fg = "${brackets}"},
                -- Aerial plugin
                AerialClassIcon = {fg = "${purple}"},
                AerialConstructorIcon = {fg = "${yellow}"},
                AerialEnumIcon = {fg = "${blue}"},
                AerialFunctionIcon = {fg = "${red}"},
                AerialInterfaceIcon = {fg = "${orange}"},
                AerialMethodIcon = {fg = "${green}"},
                AerialStructIcon = {fg = "${cyan}"},
                -- Alpha (dashboard) plugin
                -- AlphaHeader = {
                --   fg = (vim.o.background == "dark" and "${red}" or "${green}"),
                -- },
                AlphaHeader1 = {
                    fg = "${red}"
                },
                AlphaHeader2 = {
                    fg = "${cyan}"
                },
                AlphaHeader3 = {
                    fg = "${blue}"
                },
                AlphaHeader4 = {
                    fg = "${green}"
                },
                AlphaHeader5 = {
                    fg = "${yellow}"
                },
                AlphaHeader6 = {
                    fg = "${orange}"
                },
                AlphaHeader7 = {
                    fg = "${purple}"
                },
                AlphaButtonText = {
                    fg = (vim.o.background == "dark" and "${blue}" or "${purple}"),
                    style = "bold"
                },
                AlphaButtonShortcut = {
                    fg = (vim.o.background == "dark" and "${yellow}" or "${blue}"),
                    style = "italic,bold"
                },
                AlphaFooter = {fg = "${fg}", style = "italic"},
                -- LSP plugin
                LspDiagnosticsVirtualTextError = {
                    fg = "${red}",
                    style = "italic,underline"
                },
                LspDiagnosticsVirtualTextWarning = {
                    fg = "${yellow}",
                    style = "italic,underline"
                },
                LspDiagnosticsVirtualTextInformation = {
                    fg = "${blue}",
                    style = "italic,underline"
                },
                LspDiagnosticsVirtualTextHint = {
                    fg = "${cyan}",
                    style = "italic,underline"
                },
                -- Luasnip
                LuaSnipChoiceNode = {fg = "${yellow}"},
                LuaSnipInsertNode = {fg = "${yellow}"},
                -- Minimap
                MapBase = {fg = "${gray}"},
                MapCursor = {fg = "${purple}", bg = "${cursorline}"},
                -- MapRange = { fg = "${fg}" },

                -- Telescope
                TelescopeBorder = {
                    fg = "${telescope_results}",
                    bg = "${telescope_results}"
                },
                TelescopePromptBorder = {
                    fg = "${telescope_prompt}",
                    bg = "${telescope_prompt}"
                },
                TelescopePromptCounter = {fg = "${fg}"},
                TelescopePromptNormal = {fg = "${fg}", bg = "${telescope_prompt}"},
                TelescopePromptPrefix = {
                    fg = "${purple}",
                    bg = "${telescope_prompt}"
                },
                TelescopePromptTitle = {
                    fg = "${telescope_prompt}",
                    bg = "${purple}"
                },
                TelescopePreviewTitle = {
                    fg = "${telescope_results}",
                    bg = "${green}"
                },
                TelescopeResultsTitle = {
                    fg = "${telescope_results}",
                    bg = "${telescope_results}"
                },
                TelescopeMatching = {fg = "${purple}"},
                TelescopeNormal = {bg = "${telescope_results}"},
                TelescopeSelection = {bg = "${telescope_prompt}"}
            }
        }
    )
    onedarkpro.load()
end

--M.catppuccino()

M.mytheme = function()
    vim.g.mytheme_style = "catppuccin"

    local Group = require("colorbuddy.group").Group
    local g = require("colorbuddy.group").groups
    local s = require("colorbuddy.style").styles

    Group.new("CmpItemAbbr", g.Comment)
    Group.new("CmpItemAbbrDeprecated", g.Error)
    Group.new("CmpItemAbbrMatchFuzzy", g.CmpItemAbbr.fg:dark(), nil, s.italic)
    Group.new("CmpItemKind", g.Special)
    Group.new("CmpItemMenu", g.NonText)
    --vim.cmd "colorscheme mytheme"
end

--M.mytheme()
if YantNeovim.colorscheme == "nightfox" then
    M.nightfox()
elseif YantNeovim.colorscheme == "gruvbox" then
    M.gruvbox_baby()
elseif YantNeovim.colorscheme == "material" then
    M.material()
elseif YantNeovim.colorscheme == "tokyonight" then
    M.tokyonight()
    vim.highlight.link("LineNr", "Comment", true)
    vim.highlight.create("NormalFloat", {guibg = "None", guifg = "None"}, false)
    vim.highlight.create("FloatBorder", {guibg = "None"}, false)
    vim.highlight.create("WhichKeyFloat", {guibg = "None"}, false)
    vim.highlight.create("BufferTabpageFill", {guifg = "None"}, false)
    vim.highlight.create("VertSplit", {guibg = "#16161e", guifg = "#16161e"}, false)
    vim.highlight.create("TelescopeNormal", {guibg = "None", guifg = "None"}, false)
    vim.highlight.create("TelescopeBorder", {guibg = "None", guifg = "None"}, false)
    vim.highlight.link("TelescopeMatching", "Constant", true)
    vim.highlight.link("GitSignsCurrentLineBlame", "Comment", true)
    vim.highlight.create("StatusLine", {guibg = "None"}, false)
    vim.highlight.create("StatusLineNC", {guibg = "None"}, false)
elseif YantNeovim.colorscheme == "nord" then
    M.nord()
elseif YantNeovim.colorscheme == "palenightfall" then
    M.palenightfall()
elseif YantNeovim.colorscheme == "Vscode" then
    M.Vscode()
elseif YantNeovim.colorscheme == "Moonlight" then
    M.Moonlight()
elseif YantNeovim.colorscheme == "onedarker" then
    M.onedarker()
elseif YantNeovim.colorscheme == "Kanagawa" then
    M.Kanagawa()
elseif YantNeovim.colorscheme == "onedark" then
    M.onedark()
elseif YantNeovim.colorscheme == "catppuccin" then
    M.catppuccino()
elseif YantNeovim.colorscheme == "mytheme" then
    M.mytheme()
elseif YantNeovim.colorscheme == "onedarkpro" then
    M.onedarkpro()
else
    M.catppuccino()
end
