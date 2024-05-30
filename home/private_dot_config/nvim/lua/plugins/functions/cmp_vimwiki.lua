local cmp = require("cmp")

local vimwiki_source = {}

vimwiki_source.new = function()
    local self = setmetatable({}, { __index = vimwiki_source })
    return self
end

vimwiki_source.complete = function(_, _, callback)
    local current_dir = vim.fn.expand('%:p:h')
    local notes_folder = vim.fn.resolve(vim.fn.expand("~/Notes"))

    local files = vim.fn.globpath(notes_folder, "**/*.md", false, true)

    local items = {}
    for _, file in ipairs(files) do
        local note_name = vim.fn.fnamemodify(file, ":t:r")

        local Path = require('plenary.path')
        local relative_path = Path:new(file):make_relative(current_dir)

        table.insert(items, {
            label = note_name,
            insertText = string.format("[%s](%s)", note_name, relative_path),
            kind = cmp.lsp.CompletionItemKind.File,
        })
    end

    callback({ items = items, isIncomplete = false })
end

cmp.register_source("vimwiki", vimwiki_source.new())

cmp.setup.filetype("vimwiki", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = "vimwiki" },
    }, {
        { name = "buffer" },
        { name = "path" },
        { name = "luasnip" },
    }),
})
