--              AstroNvim Configuration Table
-- All configuration changes should go inside of the table below
-- You can think of a Lua "table" as a dictionary like data structure the
-- normal format is "key = value". These also handle array like data structures
-- where a value with no key simply has an implicit numeric key
local config = {

    -- Configure AstroNvim updates
    updater = {
        remote = "origin", -- remote to use
        channel = "stable", -- "stable" or "nightly"
        version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
        branch = "main", -- branch name (NIGHTLY ONLY)
        commit = nil, -- commit hash (NIGHTLY ONLY)
        pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
        skip_prompts = false, -- skip prompts about breaking changes
        show_changelog = true, -- show the changelog after performing an update
        auto_reload = false, -- automatically reload and sync packer after a successful update
        auto_quit = false -- automatically quit the current session after a successful update
        -- remotes = { -- easily add new remotes to track
        --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
        --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
        --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
        -- },
    },

    -- Set colorscheme to use
    colorscheme = "monokai",

    -- Add highlight groups in any theme
    highlights = {
        -- init = { -- this table overrides highlights in all themes
        --   Normal = { bg = "#000000" },
        -- }
        -- duskfox = { -- a table of overrides/changes to the duskfox theme
        --   Normal = { bg = "#000000" },
        -- },
    },

    -- set vim options here (vim.<first_key>.<second_key> = value)
    options = {
        opt = {
            -- set to true or false etc.
            relativenumber = true, -- sets vim.opt.relativenumber
            number = true, -- sets vim.opt.number
            spell = false, -- sets vim.opt.spell
            signcolumn = "auto", -- sets vim.opt.signcolumn to auto
            wrap = false -- sets vim.opt.wrap
        },
        g = {
            mapleader = " ", -- sets vim.g.mapleader
            autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
            cmp_enabled = true, -- enable completion at start
            autopairs_enabled = true, -- enable autopairs at start
            diagnostics_enabled = true, -- enable diagnostics at start
            status_diagnostics_enabled = true, -- enable diagnostics in statusline
            icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
            ui_notifications_enabled = true, -- disable notifications when toggling UI elements
            heirline_bufferline = false -- enable new heirline based bufferline (requires :PackerSync after changing)
        }
    },
    -- If you need more control, you can use the function()...end notation
    -- options = function(local_vim)
    --   local_vim.opt.relativenumber = true
    --   local_vim.g.mapleader = " "
    --   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
    --   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
    --
    --   return local_vim
    -- end,

    -- Set dashboard header
    header = {
        "     ██████╗  █████╗ ██████╗ ██╗   ██╗██╗  ██╗                   ",
        "    ██╔════╝ ██╔══██╗██╔══██╗╚██╗ ██╔╝╚██╗██╔╝                   ",
        "    ██║  ███╗███████║██████╔╝ ╚████╔╝  ╚███╔╝                    ",
        "    ██║   ██║██╔══██║██╔══██╗  ╚██╔╝   ██╔██╗                    ",
        "    ╚██████╔╝██║  ██║██████╔╝   ██║   ██╔╝ ██╗                   ",
        "     ╚═════╝ ╚═╝  ╚═╝╚═════╝    ╚═╝   ╚═╝  ╚═╝                   ",
        "                                                                 ",
        " █████╗ ███████╗████████╗██████╗  ██████╗ ██╗   ██╗██╗███╗   ███╗",
        "██╔══██╗██╔════╝╚══██╔══╝██╔══██╗██╔═══██╗██║   ██║██║████╗ ████║",
        "███████║███████╗   ██║   ██████╔╝██║   ██║██║   ██║██║██╔████╔██║",
        "██╔══██║╚════██║   ██║   ██╔══██╗██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
        "██║  ██║███████║   ██║   ██║  ██║╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
        "╚═╝  ╚═╝╚══════╝   ╚═╝   ╚═╝  ╚═╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝"
    },

    -- Default theme configuration
    default_theme = {
        -- Modify the color palette for the default theme
        colors = {fg = "#abb2bf", bg = "#1e222a"},
        highlights = function(hl) -- or a function that returns a new table of colors to set
            local C = require "default_theme.colors"

            hl.Normal = {fg = C.fg, bg = C.bg}

            -- New approach instead of diagnostic_style
            hl.DiagnosticError.italic = true
            hl.DiagnosticHint.italic = true
            hl.DiagnosticInfo.italic = true
            hl.DiagnosticWarn.italic = true

            return hl
        end,
        -- enable or disable highlighting for extra plugins
        plugins = {
            aerial = true,
            beacon = false,
            bufferline = true,
            cmp = true,
            dashboard = true,
            highlighturl = true,
            hop = false,
            indent_blankline = true,
            lightspeed = false,
            ["neo-tree"] = true,
            notify = true,
            ["nvim-tree"] = false,
            ["nvim-web-devicons"] = true,
            rainbow = true,
            symbols_outline = false,
            telescope = true,
            treesitter = true,
            vimwiki = false,
            ["which-key"] = true
        }
    },

    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {virtual_text = true, underline = true},

    -- Extend LSP configuration
    lsp = {
        -- enable servers that you already have installed without mason
        servers = {},
        formatting = {
            -- control auto formatting on save
            format_on_save = {
                enabled = true, -- enable or disable format on save globally
                allow_filetypes = { -- enable format on save for specified filetypes only
                    "go", "python", "rust", "markdown"
                },
                ignore_filetypes = { -- disable format on save for specified filetypes
                    -- "python",
                }
            },
            disabled = { -- disable formatting capabilities for the listed language servers
                -- "sumneko_lua",
            },
            timeout_ms = 1000 -- default format timeout
            -- filter = function(client) -- fully override the default formatting function
            --   return true
            -- end
        },
        -- easily add or disable built in mappings added during LSP attaching
        mappings = {
            n = {
                -- ["<leader>lf"] = false -- disable formatting keymap
            }
        },
        -- add to the global LSP on_attach function
        -- on_attach = function(client, bufnr)
        -- end,

        -- override the mason server-registration function
        -- server_registration = function(server, opts)
        --   require("lspconfig")[server].setup(opts)
        -- end,

        -- Add overrides for LSP server settings, the keys are the name of the server
        ["server-settings"] = {
            -- example for addings schemas to yamlls
            -- yamlls = { -- override table for require("lspconfig").yamlls.setup({...})
            --   settings = {
            --     yaml = {
            --       schemas = {
            --         ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
            --         ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
            --         ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
            --       },
            --     },
            --   },
            -- },
        }
    },

    -- Mapping data with "desc" stored directly by vim.keymap.set().
    --
    -- Please use this mappings table to set keyboard mapping since this is the
    -- lower level configuration and more robust one. (which-key will
    -- automatically pick-up stored data by this setting.)
    mappings = {
        -- first key is the mode
        n = {
            -- second key is the lefthand side of the map
            -- mappings seen under group name "Buffer"
            ["<leader>bb"] = {"<cmd>tabnew<cr>", desc = "New tab"},
            ["<leader>bc"] = {
                "<cmd>BufferLinePickClose<cr>",
                desc = "Pick to close"
            },
            ["<leader>bj"] = {"<cmd>BufferLinePick<cr>", desc = "Pick to jump"},
            ["<leader>bt"] = {
                "<cmd>BufferLineSortByTabs<cr>",
                desc = "Sort by tabs"
            }
            -- quick save
            -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
        },
        t = {
            -- setting a mapping to false will disable it
            -- ["<esc>"] = false,
        }
    },

    -- add new user interface icon
    icons = {
        VimIcon = "",
        ScrollText = "",
        GitBranch = "",
        GitAdd = "",
        GitChange = "",
        GitDelete = ""
    },
    -- modify variables used by heirline but not defined in the setup call directly
    heirline = {
        -- define the separators between each section
        separators = {
            left = {"", " "}, -- separator for the left side of the statusline
            right = {" ", ""} -- separator for the right side of the statusline
        },
        -- add new colors that can be used by heirline
        colors = function(hl)
            -- use helper function to get highlight group properties
            local comment_fg = astronvim.get_hlgroup("Comment").fg
            hl.git_branch_fg = comment_fg
            hl.git_added = comment_fg
            hl.git_changed = comment_fg
            hl.git_removed = comment_fg
            hl.blank_bg = astronvim.get_hlgroup("Folded").fg
            hl.file_info_bg = astronvim.get_hlgroup("Visual").bg
            hl.nav_icon_bg = astronvim.get_hlgroup("String").fg
            hl.nav_fg = hl.nav_icon_bg
            hl.folder_icon_bg = astronvim.get_hlgroup("Error").fg
            return hl
        end,
        attributes = {mode = {bold = true}},
        icon_highlights = {file_icon = {statusline = false}}
    },

    -- Configure plugins
    plugins = {
        init = {
            {
                "tanvirtin/monokai.nvim",
                as = "monokai",
                config = function()
                    local monokai = require "monokai"
                    local palette = monokai.classic
                    monokai.setup {
                        palette = {base4 = '#FFFFFF'},
                        custom_hlgroups = {Visual = {bg = '#FFFFFF'}}
                    }
                end
            }, -- {
            --   "catppuccin/nvim",
            --   as = "catppuccin",
            --   config = function() require("catppuccin").setup {} end,
            -- },
            {
                "simrat39/rust-tools.nvim",
                as = "rust-tools",
                config = function()
                    local rt = require "rust-tools"
                    rt.setup {
                        server = {
                            on_attach = function(_, bufnr)
                                -- Hover actions
                                vim.keymap.set("n", "<C-space>",
                                               rt.hover_actions.hover_actions,
                                               {buffer = bufnr})
                                -- Code action groups
                                vim.keymap.set("n", "<Leader>a",
                                               rt.code_action_group
                                                   .code_action_group,
                                               {buffer = bufnr})
                            end
                        }
                    }
                end
            }
            -- You can disable default plugins as follows:
            -- ["goolord/alpha-nvim"] = { disable = true },

            -- You can also add new plugins here as well:
            -- Add plugins, the packer syntax without the "use"
            -- { "andweeb/presence.nvim" },
            -- {
            --   "ray-x/lsp_signature.nvim",
            --   event = "BufRead",
            --   config = function()
            --     require("lsp_signature").setup()
            --   end,
            -- },

            -- We also support a key value style plugin definition similar to NvChad:
            -- ["ray-x/lsp_signature.nvim"] = {
            --   event = "BufRead",
            --   config = function()
            --     require("lsp_signature").setup()
            --   end,
            -- },
        },
        -- All other entries override the require("<key>").setup({...}) call for default plugins
        ["null-ls"] = function(config) -- overrides `require("null-ls").setup(config)`
            -- config variable is the default configuration table for the setup function call
            local null_ls = require "null-ls"

            -- Check supported formatters and linters
            -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
            -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
            config.sources = {
                -- Set a formatter
                null_ls.builtins.formatting.trim_whitespace,
                null_ls.builtins.formatting.prettier,
                null_ls.builtins.formatting.prettierd,
                null_ls.builtins.formatting.rustfmt,
                null_ls.builtins.formatting.terraform_fmt,
                null_ls.builtins.formatting.shfmt,
                null_ls.builtins.formatting.gofmt,
                null_ls.builtins.formatting.goimports,
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.isort,
                null_ls.builtins.formatting.clang_format,
                null_ls.builtins.formatting.markdownlint,
                null_ls.builtins.formatting.markdown_toc,
                null_ls.builtins.formatting.codespell,
                null_ls.builtins.formatting.stylua
            }

            return config -- return final config table
        end,
        treesitter = { -- overrides `require("treesitter").setup(...)`
            ensure_installed = {"lua", "rust", "toml", "python", "go", "cpp"},
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false
            },
            ident = {enable = true},
            rainbow = {
                enable = true,
                extended_mode = true,
                max_file_lines = nil
            }
        },
        -- use mason-lspconfig to configure LSP installations
        ["mason-lspconfig"] = { -- overrides `require("mason-lspconfig").setup(...)`
            ensure_installed = {
                "pyright", "rust_analyzer", "golangci_lint_ls", "clangd",
                "gopls"
            }
        },
        -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
        ["mason-null-ls"] = { -- overrides `require("mason-null-ls").setup(...)`
            ensure_installed = {
                "prettier", "prettierd", "stylua", "rustfmt", "gofmt", "shfmt",
                "codespell", "markdownlint", "clang_format"
            },
            automatic_installation = false,
            automatic_setup = true -- Recommended, but optional
        },
        ["mason-nvim-dap"] = { -- overrides `require("mason-nvim-dap").setup(...)`
            ensure_installed = {"python", "delve", "codelldb"},
            automatic_setup = true
        },

        heirline = function(config)
            -- the first element of the configuration table is the statusline
            config[1] = {
                -- default highlight for the entire statusline
                hl = {fg = "fg", bg = "bg"},
                -- each element following is a component in astronvim.status module

                -- add the vim mode component
                astronvim.status.component.mode {
                    -- enable mode text with padding as well as an icon before it
                    mode_text = {
                        icon = {
                            kind = "VimIcon",
                            padding = {right = 1, left = 1}
                        }
                    },
                    -- surround the component with a separators
                    surround = {
                        -- it's a left element, so use the left separator
                        separator = "left",
                        -- set the color of the surrounding based on the current mode using astronvim.status module
                        color = function()
                            return {
                                main = astronvim.status.hl.mode_bg(),
                                right = "blank_bg"
                            }
                        end
                    }
                },
                -- we want an empty space here so we can use the component builder to make a new section with just an empty string
                astronvim.status.component.builder {
                    {provider = ""},
                    -- define the surrounding separator and colors to be used inside of the component
                    -- and the color to the right of the separated out section
                    surround = {
                        separator = "left",
                        color = {main = "blank_bg", right = "file_info_bg"}
                    }
                },
                -- add a section for the currently opened file information
                astronvim.status.component.file_info {
                    -- enable the file_icon and disable the highlighting based on filetype
                    file_icon = {padding = {left = 0}},
                    filename = {fallback = "Empty"},
                    -- add padding
                    padding = {right = 1},
                    -- define the section separator
                    surround = {separator = "left", condition = false}
                },
                -- add a component for the current git branch if it exists and use no separator for the sections
                astronvim.status.component.git_branch {
                    surround = {separator = "none"}
                },
                -- add a component for the current git diff if it exists and use no separator for the sections
                astronvim.status.component.git_diff {
                    padding = {left = 1},
                    surround = {separator = "none"}
                },
                -- fill the rest of the statusline
                -- the elements after this will appear in the middle of the statusline
                astronvim.status.component.fill(),
                -- add a component to display if the LSP is loading, disable showing running client names, and use no separator
                astronvim.status.component.lsp {
                    lsp_client_names = false,
                    surround = {separator = "none", color = "bg"}
                },
                -- fill the rest of the statusline
                -- the elements after this will appear on the right of the statusline
                astronvim.status.component.fill(),
                -- add a component for the current diagnostics if it exists and use the right separator for the section
                astronvim.status.component.diagnostics {
                    surround = {separator = "right"}
                },
                -- add a component to display LSP clients, disable showing LSP progress, and use the right separator
                astronvim.status.component.lsp {
                    lsp_progress = false,
                    surround = {separator = "right"}
                },
                -- NvChad has some nice icons to go along with information, so we can create a parent component to do this
                -- all of the children of this table will be treated together as a single component
                {
                    -- define a simple component where the provider is just a folder icon
                    astronvim.status.component.builder {
                        -- astronvim.get_icon gets the user interface icon for a closed folder with a space after it
                        {provider = astronvim.get_icon "FolderClosed"},
                        -- add padding after icon
                        padding = {right = 1},
                        -- set the foreground color to be used for the icon
                        hl = {fg = "bg"},
                        -- use the right separator and define the background color
                        surround = {
                            separator = "right",
                            color = "folder_icon_bg"
                        }
                    },
                    -- add a file information component and only show the current working directory name
                    astronvim.status.component.file_info {
                        -- we only want filename to be used and we can change the fname
                        -- function to get the current working directory name
                        filename = {
                            fname = function(nr)
                                return vim.fn.getcwd(nr)
                            end,
                            padding = {left = 1}
                        },
                        -- disable all other elements of the file_info component
                        file_icon = false,
                        file_modified = false,
                        file_read_only = false,
                        -- use no separator for this part but define a background color
                        surround = {
                            separator = "none",
                            color = "file_info_bg",
                            condition = false
                        }
                    }
                },
                -- the final component of the NvChad statusline is the navigation section
                -- this is very similar to the previous current working directory section with the icon
                { -- make nav section with icon border
                    -- define a custom component with just a file icon
                    astronvim.status.component.builder {
                        {provider = astronvim.get_icon "ScrollText"},
                        -- add padding after icon
                        padding = {right = 1},
                        -- set the icon foreground
                        hl = {fg = "bg"},
                        -- use the right separator and define the background color
                        -- as well as the color to the left of the separator
                        surround = {
                            separator = "right",
                            color = {
                                main = "nav_icon_bg",
                                left = "file_info_bg"
                            }
                        }
                    },
                    -- add a navigation component and just display the percentage of progress in the file
                    astronvim.status.component.nav {
                        -- add some padding for the percentage provider
                        percentage = {padding = {right = 1}},
                        -- disable all other providers
                        ruler = false,
                        scrollbar = false,
                        -- use no separator and define the background color
                        surround = {separator = "none", color = "file_info_bg"}
                    }
                }
            }

            -- a second element in the heirline setup would override the winbar
            -- by only providing a single element we will only override the statusline
            -- and use the default winbar in AstroNvim

            -- return the final confiuration table
            return config
        end
    },

    -- LuaSnip Options
    luasnip = {
        -- Extend filetypes
        filetype_extend = {
            -- javascript = { "javascriptreact" },
        },
        -- Configure luasnip loaders (vscode, lua, and/or snipmate)
        vscode = {
            -- Add paths for including more VS Code style snippets in luasnip
            paths = {}
        }
    },

    -- CMP Source Priorities
    -- modify here the priorities of default cmp sources
    -- higher value == higher priority
    -- The value can also be set to a boolean for disabling default sources:
    -- false == disabled
    -- true == 1000
    cmp = {
        source_priority = {
            nvim_lsp = 1000,
            buffer = 500,
            luasnip = 300,
            path = 250
        }
    },

    -- Modify which-key registration (Use this with mappings table in the above.)
    ["which-key"] = {
        -- Add bindings which show up as group name
        register = {
            -- first key is the mode, n == normal mode
            n = {
                -- second key is the prefix, <leader> prefixes
                ["<leader>"] = {
                    -- third key is the key to bring up next level and its displayed
                    -- group name in which-key top level menu
                    ["b"] = {name = "Buffer"}
                }
            }
        }
    },

    -- This function is run last and is a good place to configuring
    -- augroups/autocommands and custom filetypes also this just pure lua so
    -- anything that doesn't fit in the normal config locations above can go here
    polish = function()
        local vim = vim
        local opt = vim.opt
        -- Set up custom filetypes
        -- vim.filetype.add {
        --   extension = {
        --     foo = "fooscript",
        --   },
        --   filename = {
        --     ["Foofile"] = "fooscript",
        --   },
        --   pattern = {
        --     ["~/%.config/foo/.*"] = "fooscript",
        --   },
        -- }

        -- Treesitter folding
        opt.foldmethod = "expr"
        opt.foldexpr = "nvim_treesitter#foldexpr()"

        -- vim.diagnostic.config({virtual_text = false})
        -- vim.diagnostic.config({signs = false})

        require("mason-nvim-dap").setup_handlers {}
    end
}

return config
