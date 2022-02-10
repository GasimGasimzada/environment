# Create environment
mkdir -p ~/.gasim-env
Copy-Item gasim.ps1 ~/.gasim-env

# Copy Oh my posh theme
Copy-Item gasim.omp.json ~/.gasim-env

# Setup powershell profile
New-Item -Path $PROFILE -ItemType File -Force
Write-Output ". ~/.gasim-env/gasim.ps1" > $PROFILE

# Install plugins
Install-Module Terminal-Icons -Scope CurrentUser -Force
Install-Module posh-git -Scope CurrentUser -Force
