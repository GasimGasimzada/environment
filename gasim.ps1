# Init Oh-my-posh
oh-my-posh --init --shell pwsh --config ~/.gasim-env/gasim.omp.json | Invoke-Expression

# Enable tab menu completion
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# Enable folder icons
Import-Module Terminal-Icons