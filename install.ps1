# Create environment
mkdir -p ~/.gasim-env
Copy-Item gasim.ps1 ~/.gasim-env

# Copy Oh my posh theme
Copy-Item gasim.omp.json ~/.gasim-env

# Setup powershell profile
New-Item -Path $PROFILE -ItemType File -Force
Write-Output ". ~/.gasim-env/gasim.ps1" > $PROFILE

# Copy git commands
mkdir -p ~/.gasim-env/bin
Copy-Item ./git-commands/*.ps1 -Destination ~/.gasim-env/bin -Recurse

# Install plugins
Install-Module Terminal-Icons -Scope CurrentUser -Force
Install-Module posh-git -Scope CurrentUser -Force
