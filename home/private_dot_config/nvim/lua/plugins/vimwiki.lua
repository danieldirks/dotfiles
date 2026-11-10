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
            vim.g.vimwiki_diary_frequency = 'daily'
            vim.g.vimwiki_ext2syntax = {
                ['.md'] = 'markdown',
                ['.markdown'] = 'markdown',
                ['.mdown'] = 'markdown',
            }
            vim.g.vimwiki_folding = "list"
            vim.g.vimwiki_global_ext = 0
            vim.g.vimwiki_hl_headers = 1
            -- mac os filesystems are case-insensitive but keep the on-disk
            -- spelling ("Notes" vs "notes"), and vimwiki compares paths
            -- case-sensitively: register the wiki with the real case so
            -- buffers opened by tools like telescope are recognized as wiki
            -- files
            local notes = vim.iter(vim.fn.readdir(vim.fn.expand('~')))
                :find(function(entry) return entry:lower() == 'notes' end)
            local notes_path = notes and '~/' .. notes or '~/notes'
            vim.g.vimwiki_list = {
                {
                    path = notes_path,
                    syntax = 'markdown',
                    ext = '.md',
                    -- see :h vimwiki-option-rss_name
                    custom_wiki2html = '~/.config/nvim/autoload/vimwiki/vimwiki2html.sh',
                    path_html = '~/.cache/vimwiki-html/',
                    -- pandoc templates, see https://pandoc.org/MANUAL.html#templates
                    template_path = vim.fn.stdpath("config") .. '/autoload/vimwiki',
                    template_default = 'default',
                    template_ext = '.html',
                },
            }

            -- resolve the notes directory from the vimwiki config
            function _G.vimwiki_notes_dir()
                local list = vim.g.vimwiki_list or {}
                local path = list[1] and list[1].path or '~/notes'
                return vim.fn.resolve(vim.fn.expand(path))
            end

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
