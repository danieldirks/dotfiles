vim.opt.laststatus = 3
vim.opt.showmode = false

local mocha = require("catppuccin.palettes").get_palette "mocha"

vim.api.nvim_command('highlight StatusBackground          term=NONE  cterm=NONE  ctermbg=NONE    ctermfg=white   gui=NONE  guibg='..mocha.mantle..'   guifg='..mocha.overlay0)

vim.api.nvim_command('highlight StatusBlock               term=NONE  cterm=NONE  ctermbg=NONE    ctermfg=white   gui=NONE  guibg='..mocha.surface0..' guifg='..mocha.text)
vim.api.nvim_command('highlight StatusBlockHighlight      term=NONE  cterm=NONE  ctermbg=NONE    ctermfg=white   gui=NONE  guibg='..mocha.surface0..' guifg='..mocha.red)
vim.api.nvim_command('highlight StatusBlockBSep           term=NONE  cterm=NONE  ctermbg=NONE    ctermfg=white   gui=NONE  guibg='..mocha.mantle..'   guifg='..mocha.surface0)

-- NORMAL
vim.api.nvim_command('highlight StatusModeNORMAL          term=bold  cterm=bold  ctermbg=NONE    ctermfg=white   gui=NONE  guibg='..mocha.lavender..' guifg='..mocha.mantle)
vim.api.nvim_command('highlight StatusModeSepNORMAL       term=bold  cterm=bold  ctermbg=NONE    ctermfg=white   gui=NONE  guibg='..mocha.surface0..' guifg='..mocha.lavender)
vim.api.nvim_command('highlight StatusModeBSepNORMAL      term=bold  cterm=bold  ctermbg=NONE    ctermfg=white   gui=NONE  guibg='..mocha.mantle..'   guifg='..mocha.lavender)
-- INSERT
vim.api.nvim_command('highlight StatusModeINSERT          term=bold  cterm=bold  ctermbg=NONE    ctermfg=white   gui=NONE  guibg='..mocha.blue..'     guifg='..mocha.mantle)
vim.api.nvim_command('highlight StatusModeSepINSERT       term=bold  cterm=bold  ctermbg=NONE    ctermfg=white   gui=NONE  guibg='..mocha.surface0..' guifg='..mocha.blue)
vim.api.nvim_command('highlight StatusModeBSepINSERT      term=bold  cterm=bold  ctermbg=NONE    ctermfg=white   gui=NONE  guibg='..mocha.mantle..'   guifg='..mocha.blue)
-- REPLACE
vim.api.nvim_command('highlight StatusModeREPLACE         term=bold  cterm=bold  ctermbg=NONE    ctermfg=white   gui=NONE  guibg='..mocha.maroon..'   guifg='..mocha.mantle)
vim.api.nvim_command('highlight StatusModeSepREPLACE      term=bold  cterm=bold  ctermbg=NONE    ctermfg=white   gui=NONE  guibg='..mocha.surface0..' guifg='..mocha.maroon)
vim.api.nvim_command('highlight StatusModeBSepREPLACE     term=bold  cterm=bold  ctermbg=NONE    ctermfg=white   gui=NONE  guibg='..mocha.mantle..'   guifg='..mocha.maroon)
-- VISUAL
vim.api.nvim_command('highlight StatusModeVISUAL          term=bold  cterm=bold  ctermbg=NONE    ctermfg=white   gui=NONE  guibg='..mocha.peach..'    guifg='..mocha.mantle)
vim.api.nvim_command('highlight StatusModeSepVISUAL       term=bold  cterm=bold  ctermbg=NONE    ctermfg=white   gui=NONE  guibg='..mocha.surface0..' guifg='..mocha.peach)
vim.api.nvim_command('highlight StatusModeBSepVISUAL      term=bold  cterm=bold  ctermbg=NONE    ctermfg=white   gui=NONE  guibg='..mocha.mantle..'   guifg='..mocha.peach)
-- V-LINE
vim.api.nvim_command('highlight StatusModeVLINE           term=bold  cterm=bold  ctermbg=NONE    ctermfg=white   gui=NONE  guibg='..mocha.peach..'    guifg='..mocha.mantle)
vim.api.nvim_command('highlight StatusModeSepVLINE        term=bold  cterm=bold  ctermbg=NONE    ctermfg=white   gui=NONE  guibg='..mocha.surface0..' guifg='..mocha.peach)
vim.api.nvim_command('highlight StatusModeBSepVLINE       term=bold  cterm=bold  ctermbg=NONE    ctermfg=white   gui=NONE  guibg='..mocha.mantle..'   guifg='..mocha.peach)
-- V-BLOCK
vim.api.nvim_command('highlight StatusModeVBLOCK          term=bold  cterm=bold  ctermbg=NONE    ctermfg=white   gui=NONE  guibg='..mocha.peach..'    guifg='..mocha.mantle)
vim.api.nvim_command('highlight StatusModeSepVBLOCK       term=bold  cterm=bold  ctermbg=NONE    ctermfg=white   gui=NONE  guibg='..mocha.surface0..' guifg='..mocha.peach)
vim.api.nvim_command('highlight StatusModeBSepVBLOCK      term=bold  cterm=bold  ctermbg=NONE    ctermfg=white   gui=NONE  guibg='..mocha.mantle..'   guifg='..mocha.peach)
-- COMMAND
vim.api.nvim_command('highlight StatusModeCOMMAND         term=bold  cterm=bold  ctermbg=NONE    ctermfg=white   gui=NONE  guibg='..mocha.mauve..'    guifg='..mocha.mantle)
vim.api.nvim_command('highlight StatusModeSepCOMMAND      term=bold  cterm=bold  ctermbg=NONE    ctermfg=white   gui=NONE  guibg='..mocha.surface0..' guifg='..mocha.mauve)
vim.api.nvim_command('highlight StatusModeBSepCOMMAND     term=bold  cterm=bold  ctermbg=NONE    ctermfg=white   gui=NONE  guibg='..mocha.mantle..'   guifg='..mocha.mauve)
-- TERMINAL
vim.api.nvim_command('highlight StatusModeTERMINAL        term=bold  cterm=bold  ctermbg=NONE    ctermfg=white   gui=NONE  guibg='..mocha.mauve..'    guifg='..mocha.mantle)
vim.api.nvim_command('highlight StatusModeSepTERMINAL     term=bold  cterm=bold  ctermbg=NONE    ctermfg=white   gui=NONE  guibg='..mocha.surface0..' guifg='..mocha.mauve)
vim.api.nvim_command('highlight StatusModeBSepTERMINAL    term=bold  cterm=bold  ctermbg=NONE    ctermfg=white   gui=NONE  guibg='..mocha.mantle..'   guifg='..mocha.mauve)


local status_mode = function ()
    local mode = vim.fn.mode()
    if mode == 'n' then
        return 'NORMAL'
    elseif mode == 'i' then
        return 'INSERT'
    elseif mode == 'R' then
        return 'REPLACE'
    elseif mode == 'v' then
        return 'VISUAL'
    elseif mode == 'V' then
        return 'VLINE'
    elseif mode == '\22' then
        return 'VBLOCK'
    elseif mode == 'c' then
        return 'COMMAND'
    elseif mode == 't' then
        return 'TERMINAL'
    end
    return mode
end

local status_file = function ()
    local name = vim.fn.expand("%:t")
    local type = vim.bo.filetype

    local icon, hl_name = require'nvim-web-devicons'.get_icon_by_filetype(type, { default = true })
    local hl = vim.api.nvim_get_hl_by_name(hl_name, true)
    hl.bg = mocha.surface0
    vim.api.nvim_set_hl(0, 'StatusFileIcon', hl)
    return name, type, icon, 'StatusFileIcon'
end

local status_file_flags = function ()
    local ro = ''
    if vim.bo.readonly then
        ro = ' '
    end
    return '%#StatusBlockHighlight#' .. ro
end

local status_git = function ()
    local branch = vim.fn.system("git -C ".. vim.fn.expand("%:p:h") .. " branch --show-current 2> /dev/null | tr -d '\n'")
    if branch ~= "" then
        return ' 󰘬 ' .. branch .. ' '
    else
        return ''
    end
end

function STATUS_LINE()
    local status = ''
    local _, type, icon, icon_hl = status_file()
    local mode = status_mode()
    status = status .. '%#StatusMode' .. mode .. '#  ' .. mode .. ' %#StatusModeSep' .. mode .. '#'  -- mode
    status = status .. '%#'..icon_hl..'# ' .. icon .. ' %#StatusBlock#' .. type .. ' ' .. status_file_flags()  -- file type
    status = status .. '%#StatusBackground#' .. status_git()  -- git
    status = status .. '%='
    status = status .. ' %#StatusModeBSepNORMAL#%#StatusModeNORMAL# %P '  -- location
    return status
end

vim.opt.statusline = '%!luaeval("STATUS_LINE()")'
