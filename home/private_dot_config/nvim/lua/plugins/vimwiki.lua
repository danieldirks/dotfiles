return {
    {
        -- notes
        -- https://github.com/vimwiki/vimwiki
        "vimwiki/vimwiki",
        dependencies = {
            -- config: ./link.lua
            "qadzek/link.vim",
        },
        init = function()
            vim.g.vimwiki_diary_rel_path = 'journals'
            vim.g.vimwiki_ext2syntax = {
                ['.md'] = 'markdown',
                ['.markdown'] = 'markdown',
                ['.mdown'] = 'markdown',
            }
            vim.g.vimwiki_folding = "list"
            vim.g.vimwiki_global_ext = 0
            vim.g.vimwiki_hl_headers = 1
            vim.g.vimwiki_list = {
                {
                    path = '~/notes/',
                    syntax = 'markdown',
                    ext = '.md',
                    -- see :h vimwiki-option-rss_name
                    custom_wiki2html = '~/.config/nvim/autoload/vimwiki/vimwiki2html.sh',
                    path_html = '~/notes-html/',
                    -- pandoc templates, see https://pandoc.org/MANUAL.html#templates
                    template_path = vim.fn.stdpath("config") .. '/autoload/vimwiki',
                    template_default = 'default',
                    template_ext = '.html',
                },
            }
            vim.g.vimwiki_markdown_link_ext = 1
            vim.g.vimwiki_folding = 'syntax'
            vim.g.vimwiki_key_mappings = {
                ['headers'] = 0,
            }

            -- journal template
            vim.api.nvim_create_autocmd('BufNewFile', {
                pattern = "*/journals/*.md",
                -- use template.md replacing %filename% with the filename excluding path and extension
                command = [[ silent 0r !cat ~/notes/journals/template.md | sed s/\%filename\%/$(echo '%' | grep -o '[^/]*$' | cut -d. -f1)/g ]],
            })
        end,
    },
}
