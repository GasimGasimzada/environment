# Setup powershell profile
New-Item -Path $PROFILE -ItemType File -Force
Write-Output ". ~/.config/gasim/gasim.ps1" > $PROFILE

# Setup zsh profile
Write-Output "source ~/.config/gasim/gasim.sh" > ~/.zshrc
Write-Output "source ~/.config/gasim/gasim.sh" > ~/.bashrc
New-Item ~/.gasim-env -Type file


# Install plugins
Install-Module Terminal-Icons -Scope CurrentUser -Force

. ../configs/neovim/install.ps1
