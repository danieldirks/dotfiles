vim.opt.laststatus = 3
vim.opt.showmode = false

local mocha = require("catppuccin.palettes").get_palette "mocha"
local magenta = mocha.pink
local purple = mocha.mauve
local red = mocha.red
local orange = mocha.peach
local yellow = mocha.yellow
local green = mocha.green
local blue = mocha.lavender
local text = mocha.text
local bgtext = mocha.overlay0
local block = mocha.surface0
local background = mocha.crust

vim.api.nvim_command('highlight StatusBackground          term=NONE  cterm=NONE  ctermbg=NONE    ctermfg=white   gui=NONE  guibg='..mocha.crust..'    guifg='..mocha.overlay0)

vim.api.nvim_command('highlight StatusModeDefault         term=bold  cterm=bold  ctermbg=magenta ctermfg=black   gui=NONE  guibg='..mocha.red..'      guifg='..mocha.crust)
vim.api.nvim_command('highlight StatusModeDefaultSep      term=bold  cterm=bold  ctermbg=black   ctermfg=magenta gui=NONE  guibg='..mocha.surface0..' guifg=NONE')
vim.api.nvim_command('highlight StatusModeNormal          term=bold  cterm=bold  ctermbg=green   ctermfg=black   gui=NONE  guibg='..mocha.lavender..' guifg='..mocha.crust)
vim.api.nvim_command('highlight StatusModeNormalSep       term=bold  cterm=bold  ctermbg=black   ctermfg=green   gui=NONE  guibg='..mocha.surface0..' guifg='..mocha.lavender)
vim.api.nvim_command('highlight StatusModeInsert          term=bold  cterm=bold  ctermbg=blue    ctermfg=black   gui=NONE  guibg='..mocha.blue..'     guifg='..mocha.crust)
vim.api.nvim_command('highlight StatusModeInsertSep       term=bold  cterm=bold  ctermbg=black   ctermfg=blue    gui=NONE  guibg='..mocha.surface0..' guifg='..mocha.blue)
vim.api.nvim_command('highlight StatusModeReplace         term=bold  cterm=bold  ctermbg=red     ctermfg=black   gui=NONE  guibg='..mocha.maroon..'   guifg='..mocha.crust)
vim.api.nvim_command('highlight StatusModeReplaceSep      term=bold  cterm=bold  ctermbg=black   ctermfg=red     gui=NONE  guibg='..mocha.surface0..' guifg='..mocha.maroon)
vim.api.nvim_command('highlight StatusModeVisual          term=bold  cterm=bold  ctermbg=magenta ctermfg=black   gui=NONE  guibg='..mocha.peach..'    guifg='..mocha.crust)
vim.api.nvim_command('highlight StatusModeVisualSep       term=bold  cterm=bold  ctermbg=black   ctermfg=magenta gui=NONE  guibg='..mocha.surface0..' guifg='..mocha.peach)
vim.api.nvim_command('highlight StatusModeCommand         term=bold  cterm=bold  ctermbg=yellow  ctermfg=black   gui=NONE  guibg='..mocha.mauve..'    guifg='..mocha.crust)
vim.api.nvim_command('highlight StatusModeCommandSep      term=bold  cterm=bold  ctermbg=black   ctermfg=yellow  gui=NONE  guibg='..mocha.surface0..' guifg='..mocha.mauve)
vim.api.nvim_command('highlight StatusModeTerminal        term=bold  cterm=bold  ctermbg=yellow  ctermfg=black   gui=NONE  guibg='..mocha.mauve..'    guifg='..mocha.crust)
vim.api.nvim_command('highlight StatusModeTerminalSep     term=bold  cterm=bold  ctermbg=black   ctermfg=yellow  gui=NONE  guibg='..mocha.surface0..' guifg='..mocha.mauve)

vim.api.nvim_command('highlight StatusBlockB              term=NONE  cterm=NONE  ctermbg=red     ctermfg=black   gui=NONE  guibg='..mocha.surface0..' guifg='..mocha.text)
vim.api.nvim_command('highlight StatusBlockBSep           term=NONE  cterm=NONE  ctermbg=NONE    ctermfg=red     gui=NONE  guibg='..mocha.crust..'    guifg='..mocha.surface0)

vim.api.nvim_command('highlight StatusBlockXSep           term=NONE  cterm=NONE  ctermbg=NONE    ctermfg=red     gui=NONE  guibg='..mocha.crust..'    guifg='..mocha.maroon)
vim.api.nvim_command('highlight StatusBlockX              term=NONE  cterm=NONE  ctermbg=red     ctermfg=black   gui=NONE  guibg='..mocha.maroon..'   guifg='..mocha.crust)
vim.api.nvim_command('highlight StatusBlockYSep           term=NONE  cterm=NONE  ctermbg=black   ctermfg=blue    gui=NONE  guibg='..mocha.maroon..'   guifg='..mocha.flamingo)
vim.api.nvim_command('highlight StatusBlockY              term=NONE  cterm=NONE  ctermbg=blue    ctermfg=black   gui=NONE  guibg='..mocha.flamingo..' guifg='..mocha.crust)


function status_mode()
    local mode = vim.fn.mode()
    if mode == 'n' then
        return '%#StatusModeNormal#  NORMAL %#StatusModeNormalSep#'
    elseif mode == 'i' then
        return '%#StatusModeInsert#  INSERT %#StatusModeInsertSep#'
    elseif mode == 'R' then
        return '%#StatusModeReplace#  REPLACE %#StatusModeReplaceSep#'
    elseif mode == 'v' then
        return '%#StatusModeVisual#  VISUAL %#StatusModeVisualSep#'
    elseif mode == 'V' then
        return '%#StatusModeVisual#  V-LINE %#StatusModeVisualSep#'
    elseif mode == '\22' then
        return '%#StatusModeVisual#  V-BLOCK %#StatusModeVisualSep#'
    elseif mode == 'c' then
        return '%#StatusModeCommand#  COMMAND %#StatusModeCommandSep#'
    elseif mode == 't' then
        return '%#StatusModeTerminal#  TERMINAL %#StatusModeTerminalSep#'
    else
        return '%#StatusModeDefault# ' .. mode .. ' %#StatusModeDefaultSep#'
    end
end

function status_file_icon()
    local name = vim.fn.expand("%:t")
    local type = vim.bo.filetype

    local icon, hl = require'nvim-web-devicons'.get_icon_by_filetype(type, { default = true })
    return icon
end

function status_git()
    local branch = vim.fn.system("git -C ".. vim.fn.expand("%:p:h") .. " branch --show-current 2> /dev/null | tr -d '\n'")
    if branch ~= "" then
        return '%#StatusBackground# 󰘬 ' .. branch .. ' '
    else
        return ''
    end
end

function status_line()
    local status = ''
    status = status .. status_mode()
    status = status .. '%#StatusBlockB# %t '  -- file name
    status = status .. status_git() .. '%#StatusBackground#'
    status = status .. '%='
    status = status .. '%#StatusBlockXSep#%#StatusBlockX# %{fnamemodify(getcwd(), ":t")} '  -- directory
    status = status .. '%#StatusBlockYSep#%#StatusBlockY# %P '  -- cursor location
    return status
end

vim.opt.statusline = '%!luaeval("status_line()")'

