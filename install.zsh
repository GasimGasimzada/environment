# Creating environment
mkdir -p ~/.gasim-env
mkdir -p ~/.gasim-env/zsh-bin
cp env.zsh ~/.gasim-env
cp .nvmrc ~/.gasim-env
cp gasim.zshrc ~/.gasim-env

# Copied all ZSH based git commands to zsh-bin/
ls git-commands | sed -E "s/(.*)\.zsh$/\1/" | xargs -I{} cp git-commands/{}.zsh ~/.gasim-env/zsh-bin/{};

# Copy Oh my posh theme
cp gasim.omp.json ~/.gasim-env/gasim.omp.json

# Download antigen
curl -sSL git.io/antigen > ~/.gasim-env/.antigenrc

# Setup ZSH
echo "source ~/.gasim-env/gasim.zshrc" > ~/.zshrc

