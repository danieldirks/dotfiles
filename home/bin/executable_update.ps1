###############
### windows ###
###############

Write-Host -ForegroundColor Yellow "`nwinget update --all"
winget update --all


###############
### chezmoi ###
###############

Write-Host -ForegroundColor Yellow "`nchezmoi update"
chezmoi update

Write-Host -ForegroundColor Yellow "`nchezmoi git status"
chezmoi git status
