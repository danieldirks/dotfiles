###############
### windows ###
###############

Write-Host -ForegroundColor Yellow "`nwinget update"
winget update --all --include-unknown


###############
### chezmoi ###
###############

Write-Host -ForegroundColor Yellow "`nchezmoi update"
chezmoi update

Write-Host -ForegroundColor Yellow "`nchezmoi git status"
chezmoi git status
