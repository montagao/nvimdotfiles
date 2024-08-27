-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require('lazy').setup({
    -- Markdown preview
    -- cursor-like plugin
    {
        "yetone/avante.nvim",
        event = "VeryLazy",
        build = "make",
        opts = {
            provider = "openrouter",
            vendors = {
                --@type AvanteProvider
                ["openrouter"] = {
                    endpoint = "https://openrouter.ai/api/v1/chat/completions",
                    model = "anthropic/claude-3.5-sonnet",
                    api_key_name = "OPENROUTER_API_KEY",
                    parse_curl_args = function(opts, code_opts)
                        return {
                            url = opts.endpoint,
                            headers = {
                                ["Content-Type"] = "application/json",
                                ["Authorization"] = "Bearer " .. os.getenv(opts.api_key_name),
                                ["HTTP-Referer"] = "https://go.translate.mom", -- Replace with your actual site URL
                                ["X-Title"] = "TranslateMom",                  -- Replace with your actual site name
                            },
                            body = {
                                model = opts.model,
                                messages = require("avante.providers").openai.parse_message(code_opts), -- you can make your own message, but this is very advanced
                                temperature = 0,
                                max_tokens = 4096,
                                stream = true, -- this will be set by default.
                            },
                        }
                    end,
                    parse_response_data = function(data_stream, event_state, opts)
                        require("avante.providers").openai.parse_response(data_stream, event_state, opts)
                    end,
                },
            },
        },
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "stevearc/dressing.nvim",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            --- The below is optional, make sure to setup it properly if you have lazy=true
            {
                'MeanderingProgrammer/render-markdown.nvim',
                opts = {
                    file_types = { "markdown", "Avante" },
                },
                ft = { "markdown", "Avante" },
            },
        },
    },

    -- Other plugins
    'jannis-baum/vivify.vim',
    'folke/twilight.nvim',
    'montagao/dailywriter.nvim',
    'montagao/todomon',
    'junegunn/goyo.vim',
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate'
    },
    'nvim-treesitter/playground',
    'theprimeagen/harpoon',
    'mbbill/undotree',
    'tpope/vim-fugitive',
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            { 'neovim/nvim-lspconfig' }, -- Required
            {
                'williamboman/mason.nvim',
                build = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional
            { 'hrsh7th/nvim-cmp' },                  -- Required
            { 'hrsh7th/cmp-nvim-lsp' },              -- Required
            { 'L3MON4D3/LuaSnip' },                  -- Required
        }
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({})
        end,
        opts = {
            suggestion = {
                auto_trigger = true,
            }
        }
    }

})

