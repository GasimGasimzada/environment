#!/bin/zsh
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

hide_desktop() {
    print_setup "Hiding desktop... "
    defaults write com.apple.finder CreateDesktop -bool false
    killall Finder
    print_done
}

setup_env() {
    print_setup "Setting up environment... "
    pwsh install.ps1
    print_done
}

install_homebrew
change_screenshots_dir
hide_desktop
setup_env()
