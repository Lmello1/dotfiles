return function(use)

    use {
        'nvim-lualine/lualine.nvim',
        requires = {
            'kyazdani42/nvim-web-devicons',
        },
        --after = 'EdenEast/nightfox.nvim',
        config = function()
            -- Color for highlights
            local colors = {
                yellow = '#ECBE7B',
                cyan = '#008080',
                darkblue = '#081633',
                green = '#98be65',
                orange = '#FF8800',
                violet = '#a9a1e1',
                magenta = '#c678dd',
                blue = '#51afef',
                red = '#ec5f67'
            }
            
            local config = {
                options = {
                    icons_enabled = true,
                    theme = 'auto',
                },
                sections = {
                    lualine_a = {'mode'},
                    lualine_b = {'filename'},
                    lualine_c = {},
                    lualine_x = {},
                    lualine_y = {'encoding', 'fileformat', 'filetype'},
                    lualine_z = {'branch'},
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = {'filename'},
                    lualine_x = {'location'},
                    lualine_y = {},
                    lualine_z = {}
                },
                tabline = {},
                extensions = {}
            }
            
            
            -- Inserts a component in lualine_c at left section
            local function ins_left(component)
              table.insert(config.sections.lualine_c, component)
            end
            
            -- Inserts a component in lualine_x ot right section
            local function ins_right(component)
              table.insert(config.sections.lualine_x, component)
            end
            
            ins_left {
            	'lsp_progress',
            	colors = {
            	  percentage  = colors.cyan,
            	  title  = colors.cyan,
            	  message  = colors.cyan,
            	  spinner = colors.cyan,
            	  lsp_client_name = colors.yellow,
            	  use = true,
            	},
            	separators = {
            		component = ' ',
            		progress = ' | ',
            		message = { pre = '(', post = ')'},
            		percentage = { pre = '', post = '%% ' },
            		title = { pre = '', post = ': ' },
            		lsp_client_name = { pre = '[', post = ']' },
            		spinner = { pre = '', post = '' },
            	},
            	display_components = { 'lsp_client_name', { 'title', 'percentage', 'message' }, 'spinner' },
            	timer = { progress_enddelay = 500, spinner = 500, lsp_client_name_enddelay = 1000 },
            	spinner_symbols = { "⠋ ", "⠙ ", "⠹ ", "⠸ ", "⠼ ", "⠴ ", "⠦ ", "⠧ ", "⠇ ", "⠏ " },
            }
            
            require('lualine').setup(config)
        end
    }
    --Extension to lualine showing LSP progress messages
    use {
        'arkav/lualine-lsp-progress',
        requires = {
            'nvim-lualine/lualine.nvim',
        }
    }
end
