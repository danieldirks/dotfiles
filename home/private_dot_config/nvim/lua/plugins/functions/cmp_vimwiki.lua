local cmp = require("cmp")
local Path = require('plenary.path')
local scandir = require('plenary.scandir')

local vimwiki_source = {}

vimwiki_source.new = function()
    local self = setmetatable({}, { __index = vimwiki_source })
    return self
end

vimwiki_source.get_trigger_characters = function() return {'['} end

vimwiki_source.complete = function(self, _, callback)
    -- define paths
    local current_dir = vim.fn.expand('%:p:h')
    local notes_folder = vim.fn.resolve(vim.fn.expand("~/Notes"))

    local scandir_opts = {
        search_pattern = "**/*.md",
        on_exit = function (results)
            self:_candidates(results, current_dir, callback)
        end,
    }

    -- asynchronously load notes
    scandir.scan_dir_async(notes_folder, scandir_opts)
end

vimwiki_source._candidates = function(_, files, current_dir, callback)
    local items = {}
    for _, file in ipairs(files) do
        local relative_path = Path:new(file):make_relative(current_dir)

        -- use relative path without extension as name
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

cmp.register_source("vimwiki", vimwiki_source.new())

cmp.setup.filetype("vimwiki", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = "vimwiki" },
        { name = "luasnip" },
    }, {
        { name = "buffer" },
    }),
})
