local function vimwiki_source()
    local cmp = require("cmp")
    local Path = require("plenary.path")
    local scandir = require("plenary.scandir")

    local source = {}

    source.new = function()
        local self = setmetatable({}, { __index = source })
        return self
    end

    source.get_trigger_characters = function() return {'['} end

    source.complete = function(self, _, callback)
        -- define paths
        local current_dir = vim.fn.expand("%:p:h")
        local notes_folder = vim.fn.resolve(vim.fn.expand("~/notes"))

        local scandir_opts = {
            search_pattern = "**/*.md",
            on_exit = function (results)
                self:_candidates(results, current_dir, callback)
            end,
        }

        -- asynchronously load notes
        scandir.scan_dir_async(notes_folder, scandir_opts)
    end

    source._candidates = function(_, files, current_dir, callback)
        local items = {}
        for _, file in ipairs(files) do
            -- Does not return relative paths for parent directories
            -- See https://github.com/nvim-lua/plenary.nvim/issues/411
            local relative_path = Path:new(file):make_relative(current_dir)

            -- use file name without extension as name
            local note_name = vim.fn.fnamemodify(relative_path, ":r")

            -- determin page title from markdown
            local note_title = Path:new(file):head(1)
            if note_title:match('^# .*') then
                note_title = string.sub(note_title, 3)
            else
                note_title = note_name
            end

            table.insert(items, {
                label = note_name,
                insertText = string.format("[%s](%s)", note_title, relative_path),
                kind = cmp.lsp.CompletionItemKind.File,
            })
        end

        callback(items)
    end

    return source
end


return {
    -- autocompletion
    {
        -- nvim-cmp https://github.com/hrsh7th/nvim-cmp
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-nvim-lua",
            "saadparwaiz1/cmp_luasnip",
        },
        config = function()
            local luasnip = require("luasnip")
            local cmp = require("cmp")
            vim.opt.completeopt = { "menu", "menuone", "noselect" }

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            if luasnip.expandable() then
                                luasnip.expand()
                            else
                                cmp.confirm({
                                    select = true,
                                })
                            end
                        else
                            fallback()
                        end
                    end),

                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.locally_jumpable(1) then
                            luasnip.jump(1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),

                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.locally_jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                }, {
                    { name = "nvim_lua" },
                    { name = "path" },
                    { name = "buffer" },
                }),
            })

            cmp.setup.cmdline(":", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = "path" },
                }, {
                    { name = "cmdline" },
                }),
            })

            -- vimwiki file completion
            cmp.register_source("vimwiki", vimwiki_source().new())
            cmp.setup.filetype("vimwiki", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = "vimwiki" },
                    { name = "luasnip" },
                }, {
                    { name = "path" },
                    { name = "buffer" },
                }),
            })

            -- nvim-autopairs config, see https://github.com/windwp/nvim-autopairs
            local cmp_autopairs = require("nvim-autopairs.completion.cmp")
            cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end
    },

    -- snippets
    {
        -- LuaSnip https://github.com/L3MON4D3/LuaSnip
        "L3MON4D3/LuaSnip",
        dependencies = {
            -- snippet collections
            --"rafamadriz/friendly-snippets",
            "honza/vim-snippets",
        },
        init = function()
            require("luasnip.loaders.from_snipmate").lazy_load()
            require("luasnip.loaders.from_vscode").lazy_load()
        end,
    },
}
