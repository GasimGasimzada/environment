# Init Oh-my-posh
oh-my-posh --init --shell pwsh --config ~/.config/gasim/gasim.omp.json | Invoke-Expression

# Enable tab menu completion
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# Enable folder icons
Import-Module Terminal-Icons
Import-Module posh-git

$env:POSH_GIT_ENABLED = $true
