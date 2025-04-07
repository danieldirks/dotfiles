vim.opt.laststatus = 3
vim.opt.showmode = false

local mocha = require("catppuccin.palettes").get_palette "mocha"

vim.api.nvim_command('highlight StatusText            term=NONE  cterm=NONE  ctermbg=NONE    ctermfg=white   gui=NONE  guibg='..mocha.mantle..'   guifg='..mocha.text)
vim.api.nvim_command('highlight StatusBackground      term=NONE  cterm=NONE  ctermbg=NONE    ctermfg=white   gui=NONE  guibg='..mocha.mantle..'   guifg='..mocha.overlay0)

vim.api.nvim_command('highlight StatusErrors          term=NONE  cterm=NONE  ctermbg=NONE    ctermfg=white   gui=NONE  guibg='..mocha.mantle..'   guifg='..mocha.red)
vim.api.nvim_command('highlight StatusWarnings        term=NONE  cterm=NONE  ctermbg=NONE    ctermfg=white   gui=NONE  guibg='..mocha.mantle..'   guifg='..mocha.yellow)
vim.api.nvim_command('highlight StatusInfos           term=NONE  cterm=NONE  ctermbg=NONE    ctermfg=white   gui=NONE  guibg='..mocha.mantle..'   guifg='..mocha.sky)

vim.api.nvim_command('highlight StatusLsp             term=NONE  cterm=NONE  ctermbg=NONE    ctermfg=white   gui=NONE  guibg='..mocha.peach..'    guifg='..mocha.mantle)

vim.api.nvim_command('highlight StatusModeN           term=bold  cterm=bold  ctermbg=NONE    ctermfg=white   gui=NONE  guibg='..mocha.green..'    guifg='..mocha.mantle)
vim.api.nvim_command('highlight StatusModeI           term=bold  cterm=bold  ctermbg=NONE    ctermfg=white   gui=NONE  guibg='..mocha.lavender..' guifg='..mocha.mantle)
vim.api.nvim_command('highlight StatusModeR           term=bold  cterm=bold  ctermbg=NONE    ctermfg=white   gui=NONE  guibg='..mocha.maroon..'   guifg='..mocha.mantle)
vim.api.nvim_command('highlight StatusModeV           term=bold  cterm=bold  ctermbg=NONE    ctermfg=white   gui=NONE  guibg='..mocha.peach..'    guifg='..mocha.mantle)
vim.api.nvim_command('highlight StatusModeC           term=bold  cterm=bold  ctermbg=NONE    ctermfg=white   gui=NONE  guibg='..mocha.mauve..'    guifg='..mocha.mantle)
vim.api.nvim_command('highlight StatusModeT           term=bold  cterm=bold  ctermbg=NONE    ctermfg=white   gui=NONE  guibg='..mocha.mauve..'    guifg='..mocha.mantle)


local status_mode = function ()
    local mode = vim.fn.mode()
    if mode == 'n' then        -- normal
        return 'N'
    elseif mode == 'i' then    -- insert
        return 'I'
    elseif mode == 'R' then    -- replace
        return 'R'
    elseif mode == 'v' then    -- visual
        return 'V'
    elseif mode == 'V' then    -- visual line
        return 'V'
    elseif mode == '\22' then  -- visual block
        return 'V'
    elseif mode == 'c' then    -- command
        return 'C'
    elseif mode == 't' then    -- terminal
        return 'T'
    end
    return mode
end

local status_file = function ()
    -- file path
    local fpath = vim.fn.fnamemodify(vim.fn.expand "%", ":~:.:h")
    if fpath == "" or fpath == "." then
        fpath = ""
    else
        fpath = fpath .. "/"
    end

    -- file type icon
    local type = vim.bo.filetype
    local icon, hl_name = require'nvim-web-devicons'.get_icon_by_filetype(type, { default = true })
    local hl = vim.api.nvim_get_hl_by_name(hl_name, true)
    hl.bg = mocha.mantle
    vim.api.nvim_set_hl(0, 'StatusFileIcon', hl)

    -- filter out specific buffers
    if type == "alpha" or type == "oil" then
        return ""
    end

    -- file name
    local fname = vim.fn.expand("%:t")
    if fname == "" then
        return fpath
    end

    -- read only indicator
    local ro = ""
    if vim.bo.readonly then
        ro = " "
    end

    return "%#StatusFileIcon#" .. icon .. "%#StatusText# " .. fpath .. fname .. ro
end

local status_type = function ()
    local name = vim.fn.expand("%:t")
    local type = vim.bo.filetype

    if type == "" then
        return " [buffer] "
    end

    local icon, hl_name = require'nvim-web-devicons'.get_icon_by_filetype(type, { default = true })
    local hl = vim.api.nvim_get_hl_by_name(hl_name, true)
    hl.bg = mocha.mantle
    vim.api.nvim_set_hl(0, 'StatusFileIcon', hl)

    local ro = ""
    if vim.bo.readonly then
        ro = " "
    end

    return "%#StatusText# " .. icon .. "%#StatusText# " .. type .. ro .. " "
end

local status_git = function ()
    local branch = vim.fn.system("git -C ".. vim.fn.expand("%:p:h") .. " branch --show-current 2> /dev/null | tr -d '\n'")
    if branch ~= "" then
        return "%#StatusText# 󰘬 " .. branch .. " "
    else
        return ""
    end
end

local status_diagnostics = function ()
    local diagnostics = ""

    local levels = vim.diagnostic.severity
    local errors = #vim.diagnostic.get(0, {severity = levels.ERROR})
    if errors > 0 then
        diagnostics = diagnostics .. " %#StatusErrors# " .. errors
    end

    local warnings = #vim.diagnostic.get(0, {severity = levels.WARN})
    if warnings > 0 then
        diagnostics = diagnostics .. " %#StatusWarnings# " .. warnings
    end

    return diagnostics .. "%#StatusText# "
end

local status_lsp = function ()
    if #vim.lsp.get_clients({ bufnr = 0 }) == 0 then
        return ""
    end

    local lsp = vim.lsp.get_clients({ bufnr = 0 })[1]
    if lsp then
        local name = lsp.name or ""
        return "%#StatusLsp# 󰒓 "
    end

    return ""
end

local status_encoding = function ()
    -- filter out specific buffers
    if vim.bo.filetype == "alpha" then
        return ""
    end

    local icon = ""
    local fileformat = vim.api.nvim_get_option_value("fileformat", {})
    if fileformat == "dos" then
        icon = ""
    end

    if fileformat == "unix" then
        icon = ""
    end

    local encoding = vim.api.nvim_get_option_value("fileencoding", {})
    return " " .. icon .. " "
end

local status_position = function ()
    -- filter out specific buffers
    if vim.bo.filetype == "alpha" then
        return ""
    end

    local view = "%P"
    local cursor = "%l:%c"

    return "" .. cursor .. " "
end

function STATUS_LINE()
    local mode = status_mode()

    return table.concat {
        -- mode
        --"%#StatusText#  ",
        "%#StatusMode"..mode.."# " .. mode .. " %#StatusText#",
        -- git
        status_git(),
        --"%{get(b:,'gitsigns_status','')}",
        -- split area (truncate right side)
        "%<%=",
        -- file name
        status_file(),
        -- split area
        "%=",
        -- diagnostics
        status_diagnostics(),
        -- encoding
        status_encoding(),
        -- cursor position
        status_position(),
        -- lsp
        status_lsp(),
    }
end

vim.opt.statusline = "%!luaeval('STATUS_LINE()')"
