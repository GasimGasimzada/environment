# Downloading Antigen
echo "Downloading Antigen"
curl -sSL git.io/antigen > ~/.antigenrc

# Configuring
echo "Setting up powerlevel9k"
cp .powerlevel9k ~/.powerlevel9k
cp .zshrc ~/.zshrc
cp .zshenv ~/.zshenv

# Complete
echo "Done!"
