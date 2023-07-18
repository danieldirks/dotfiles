vim.opt.laststatus = 2
vim.opt.showmode = false

local macchiato = require("catppuccin.palettes").get_palette "macchiato"
local magenta = macchiato.pink
local red = macchiato.red
local orange = macchiato.peach
local yellow = macchiato.yellow
local green = macchiato.green
local blue = macchiato.blue
local text = macchiato.text
local bgtext = macchiato.overlay0
local block = macchiato.surface0
local background = macchiato.mantle

vim.api.nvim_command('highlight StatusBackground          term=NONE  cterm=NONE  ctermbg=NONE    ctermfg=white   gui=NONE  guibg='..background..' guifg='..bgtext)

vim.api.nvim_command('highlight StatusModeDefault         term=bold  cterm=bold  ctermbg=magenta ctermfg=black   gui=NONE  guibg='..magenta..'    guifg='..background)
vim.api.nvim_command('highlight StatusModeDefaultSep      term=bold  cterm=bold  ctermbg=black   ctermfg=magenta gui=NONE  guibg='..block..'      guifg=NONE')
vim.api.nvim_command('highlight StatusModeNormal          term=bold  cterm=bold  ctermbg=green   ctermfg=black   gui=NONE  guibg='..green..'      guifg='..background)
vim.api.nvim_command('highlight StatusModeNormalSep       term=bold  cterm=bold  ctermbg=black   ctermfg=green   gui=NONE  guibg='..block..'      guifg='..green)
vim.api.nvim_command('highlight StatusModeInsert          term=bold  cterm=bold  ctermbg=blue    ctermfg=black   gui=NONE  guibg='..blue..'       guifg='..background)
vim.api.nvim_command('highlight StatusModeInsertSep       term=bold  cterm=bold  ctermbg=black   ctermfg=blue    gui=NONE  guibg='..block..'      guifg='..blue)
vim.api.nvim_command('highlight StatusModeReplace         term=bold  cterm=bold  ctermbg=red     ctermfg=black   gui=NONE  guibg='..red..'        guifg='..background)
vim.api.nvim_command('highlight StatusModeReplaceSep      term=bold  cterm=bold  ctermbg=black   ctermfg=red     gui=NONE  guibg='..block..'      guifg='..red)
vim.api.nvim_command('highlight StatusModeVisual          term=bold  cterm=bold  ctermbg=magenta ctermfg=black   gui=NONE  guibg='..magenta..'    guifg='..background)
vim.api.nvim_command('highlight StatusModeVisualSep       term=bold  cterm=bold  ctermbg=black   ctermfg=magenta gui=NONE  guibg='..block..'      guifg='..magenta)
vim.api.nvim_command('highlight StatusModeCommand         term=bold  cterm=bold  ctermbg=yellow  ctermfg=black   gui=NONE  guibg='..orange..'     guifg='..background)
vim.api.nvim_command('highlight StatusModeCommandSep      term=bold  cterm=bold  ctermbg=black   ctermfg=yellow  gui=NONE  guibg='..block..'      guifg='..orange)

vim.api.nvim_command('highlight StatusBlockBackground     term=NONE  cterm=NONE  ctermbg=black   ctermfg=white   gui=NONE  guibg='..block..'      guifg='..text)
vim.api.nvim_command('highlight StatusBlockDirectorySep   term=NONE  cterm=NONE  ctermbg=NONE    ctermfg=blue    gui=NONE  guibg=NONE             guifg='..red)
vim.api.nvim_command('highlight StatusBlockDirectoryIcon  term=NONE  cterm=NONE  ctermbg=blue    ctermfg=black   gui=NONE  guibg='..red..'        guifg='..background)
vim.api.nvim_command('highlight StatusBlockLocationSep    term=NONE  cterm=NONE  ctermbg=black   ctermfg=blue    gui=NONE  guibg='..block..'      guifg='..blue)
vim.api.nvim_command('highlight StatusBlockLocation       term=NONE  cterm=NONE  ctermbg=blue    ctermfg=black   gui=NONE  guibg='..blue..'       guifg='..background)


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
    else
        return '%#StatusModeDefault# ' .. mode .. ' %#StatusModeDefaultSep#'
    end
end

function status_file_icon()
    local type = vim.bo.filetype
    if type == 'lua' then
        return ''
    elseif type == 'sh' or type == 'zsh' then
        return ''
    elseif type == 'vim' then
        return ''
    elseif type == 'cpp' then
        return ''
    elseif type == 'c' then
        return ''
    elseif type == 'javascript' then
        return ''
    else
        return '󰈚'
    end
end

function status_git()
    local branch = vim.fn.system("git -C ".. vim.fn.expand("%:p:h") .. " branch --show-current 2> /dev/null | tr -d '\n'")
    if branch ~= "" then
        return '%#StatusBackground#  󰘬 ' .. branch .. ' '
    else
        return ''
    end
end

function status_line()
    local status = ''
    status = status .. status_mode()
    status = status .. '%#StatusBlockBackground#  ' .. status_file_icon() .. ' %t '  -- file name
    status = status .. status_git() .. '%#StatusBackground#'
    status = status .. '%='
    status = status .. '%#StatusBlockDirectorySep#%#StatusBlockDirectoryIcon# %#StatusBlockBackground# %{fnamemodify(getcwd(), ":t")} '  -- directory
    status = status .. '%#StatusBlockLocationSep#%#StatusBlockLocation# %#StatusBlockBackground# %P '  -- cursor location
    return status
end

vim.opt.statusline = '%!luaeval("status_line()")'
