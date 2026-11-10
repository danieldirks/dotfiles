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

            -- resolve the notes dir with its on-disk case (macOS fs ignores
            -- case, vimwiki compares case-sensitively); result is cached
            local notes_dir
            function _G.vimwiki_notes_dir()
                if not notes_dir then
                    local name = vim.iter(vim.fn.readdir(vim.fn.expand('~')))
                        :find(function(entry) return entry:lower() == 'notes' end) or 'notes'
                    notes_dir = vim.fn.resolve(vim.fn.expand('~/' .. name))
                end
                return notes_dir
            end

            vim.g.vimwiki_list = {
                {
                    path = vimwiki_notes_dir(),
                    syntax = 'markdown',
                    ext = '.md',
                    -- see :h vimwiki-option-rss_name
                    custom_wiki2html = vim.fs.joinpath(vim.fn.stdpath('config'), 'autoload/vimwiki/vimwiki2html.sh'),
                    path_html = vim.fs.joinpath(vim.fn.stdpath('cache'), 'vimwiki-html'),
                    -- pandoc templates, see https://pandoc.org/MANUAL.html#templates
                    template_path = vim.fs.joinpath(vim.fn.stdpath('config'), 'autoload/vimwiki'),
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
