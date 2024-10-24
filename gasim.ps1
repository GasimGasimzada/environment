# Init Oh-my-posh
oh-my-posh --init --shell pwsh --config ~/.config/gasim/gasim.omp.json | Invoke-Expression
fnm env --use-on-cd --shell power-shell | Out-String | Invoke-Expression
Invoke-Expression (& { (zoxide init powershell | Out-String) })

# Enable tab menu completion
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# Enable folder icons
Import-Module Terminal-Icons
Import-Module posh-git

$env:POSH_GIT_ENABLED = $true

Set-Alias -Name cd -Value z -Option AllScope
