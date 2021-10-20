print_setup() {
    printf "\e[0;34m$1\033[0m"
}

print_done() {
    printf "\e[0;32mDone!\033[0m\n"
}

install_homebrew() {
    print_setup "Downloading Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # install homebrew bundle
    brew tap homebrew/bundle

    # install apps from brewfile
    brew bundle
    print_done
}

change_screenshots_dir() {
    print_setup "Changing Screenshots directory to ~/Screenshots... "
    mkdir -p ~/Screenshots
    defaults write com.apple.screencapture location ~/Screenshots
    print_done
}

setup_nvm() {
    print_setup "Setting up NVM... "

    curl -so- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.1/install.sh | bash

    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

    # Install Node latest
    nvm install node

    # Install Node LTS
    nvm install lts/*

    print_done
}

hide_desktop() {
    print_setup "Hiding desktop... "
    defaults write com.apple.finder CreateDesktop -bool false
    killall Finder
    print_done
}

setup_zsh() {
    print_setup "Setting up ZSH... "
    ./install.zsh
    print_done
}

setup_vim() {
    print_setup "Setting up VIM... "

    curl -SsL https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
    sh installer.sh ~/.vim/dein > /dev/null
    cp .vimrc ~/.vimrc

    # Cleanup
    rm installer.sh

    print_done
}

install_homebrew
change_screenshots_dir
hide_desktop
setup_zsh
setup_vim
setup_nvm