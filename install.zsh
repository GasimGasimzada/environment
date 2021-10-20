# Creating environment
mkdir -p ~/.gasim-env
cp .env ~/.gasim-env/.env
cp .nvmrc ~/.gasim-env/.nvmrc
cp gasim.zshrc ~/.gasim-env/gasim.zshrc

# Copy Oh my posh theme
cp gasim.omp.json ~/.gasim-env/gasim.omp.json

# Download antigen
curl -sSL git.io/antigen > ~/.gasim-env/.antigenrc

# Setup ZSH
echo "source ~/.gasim-env/gasim.zshrc" > ~/.zshrc

