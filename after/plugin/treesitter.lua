require 'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all"
    autotag = {
        enable = true,
    },
    indent = {
        enable = false,
    },
    -- One of "all", "maintained" (parsers with maintainers), or a list of languages
    ensure_installed = 'all',
    -- Install languages synchronously (only applied to `ensure_installed`)
    sync_install = false,
    -- List of parsers to ignore installing
    ignore_install = {},
    playground = {
        enable = true,
        disable = {},
        updatetime = 25,       -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false, -- Whether the query persists across vim sessions
        keybindings = {
            toggle_query_editor = 'o',
            toggle_hl_groups = 'i',
            toggle_injected_languages = 't',
            toggle_anonymous_nodes = 'a',
            toggle_language_display = 'I',
            focus_language = 'f',
            unfocus_language = 'F',
            update = 'R',
            goto_node = '<cr>',
            show_help = '?',
        },
    },
    highlight = {
        -- `false` will disable the whole extension
        enable = true,

        -- list of language that will be disabled
        disable = {},

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = 'gnn',
            node_incremental = '.',
            scope_incremental = 'grc',
            node_decremental = ',',
        },
    },
    -- textsubjects = {
    --   enable = true,
    --   prev_selection = ',', -- (Optional) keymap to select the previous selection
    --   keymaps = {
    --     ['.'] = 'textsubjects-smart',
    --     -- [';'] = 'textsubjects-container-outer',
    --   },
    -- },

    textobjects = {
        select = {
            enable = true,
            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,
            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ['af'] = '@function.outer',
                ['if'] = '@function.inner',
                ['ac'] = '@conditional.outer',
                ['ic'] = '@conditional.inner',
                ['ai'] = '@call.outer',
                ['ii'] = '@call.inner',
                ['ab'] = '@block.outer',
                ['ib'] = '@block.inner',
                ['is'] = '@statement.inner',
                ['as'] = '@statement.outer',
                ['aC'] = '@class.outer',
                ['iC'] = '@class.inner',
                ['al'] = '@loop.outer',
                ['il'] = '@loop.inner',
            },
        },
        swap = {
            enable = true,
            swap_next = {
                ['<leader>a'] = '@parameter.inner',
            },
            swap_previous = {
                ['<leader>A'] = '@parameter.inner',
            },
        },
        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
                [']m'] = '@function.outer',
                [']]'] = { query = '@class.outer', desc = 'Next class start' },
                [']o'] = '@loop.*',
                [']s'] = { query = '@scope', query_group = 'locals', desc = 'Next scope' },
                [']z'] = { query = '@fold', query_group = 'folds', desc = 'Next fold' },
            },
            goto_next_end = {
                [']M'] = '@function.outer',
                [']['] = '@class.outer',
            },
            goto_previous_start = {
                ['[m'] = '@function.outer',
                ['[['] = '@class.outer',
            },
            goto_previous_end = {
                ['[M'] = '@function.outer',
                ['[]'] = '@class.outer',
            },
            goto_next = {
                [']d'] = '@conditional.outer',
            },
            goto_previous = {
                ['[d'] = '@conditional.outer',
            },
        },
        lsp_interop = {
            enable = true,
            border = 'none',
            peek_definition_code = {
                ['<leader>sd'] = '@function.outer',
                ['<leader>sD'] = '@class.outer',
            },
        },
    },
}
