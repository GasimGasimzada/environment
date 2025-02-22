# Env vars
$env:GASIM_ENV = "$HOME/.config/gasim"
$env:PATH += ";$env:GASIM_ENV/bin/ps1"
$env:OMP_CACHE_DIR = "$env:GASIM_ENV/.cache"

# Init Oh-my-posh
oh-my-posh --init --shell pwsh --config ~/.config/gasim/gasim.omp.json | Invoke-Expression
fnm env --use-on-cd --shell power-shell | Out-String | Invoke-Expression
Invoke-Expression (& { (zoxide init powershell | Out-String) })

# Enable tab menu completion
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# Enable folder icons
Import-Module Terminal-Icons

Set-Alias -Name cd -Value z -Option AllScope
