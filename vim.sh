echo "Downloading Dein"
curl -SsL https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh

echo "Setting up Vim"
sh installer.sh ~/.vim/dein > /dev/null
cp .vimrc ~/.vimrc

# Cleanup
rm installer.sh

echo "Done!"
