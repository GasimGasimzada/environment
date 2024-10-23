# Setup powershell profile
New-Item -Path $PROFILE -ItemType File -Force
Write-Output ". ~/.config/gasim/gasim.ps1" > $PROFILE

# Setup zsh profile
Write-Output "source ~/.config/gasim/gasim.zshrc" > ~/.zshrc

# Install plugins
Install-Module Terminal-Icons -Scope CurrentUser -Force
Install-Module posh-git -Scope CurrentUser -Force

. ../configs/wezterm/install.ps1
. ../configs/neovim/install.ps1
