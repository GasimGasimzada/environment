# Create environment
mkdir -p ~/.gasim-env
cp .env ~/.gasim-env
cp gasim.ps1 ~/.gasim-env

# Copy Oh my posh theme
cp gasim.omp.json ~/.gasim-env

# Setup powershell profile
New-Item -Path $PROFILE -ItemType File -Force
echo ". ~/.gasim-env/gasim.ps1" > $PROFILE

# Install plugins
Install-Module Terminal-Icons -Scope CurrentUser
