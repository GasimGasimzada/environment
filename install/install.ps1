# Setup powershell profile
New-Item -Path $PROFILE -ItemType File -Force
Write-Output ". ~/.config/gasim/gasim.ps1" > $PROFILE

# Install plugins
Install-Module Terminal-Icons -Scope CurrentUser -Force
Install-Module posh-git -Scope CurrentUser -Force
