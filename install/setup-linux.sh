#!/bin/bash
print_setup() {
    printf "\e[0;34m$1\033[0m"
}

print_done() {
    printf "\e[0;32mDone!\033[0m\n"
}

install_homebrew() {
    print_setup "Downloading Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

    # install homebrew bundle
    brew tap homebrew/bundle

    # install apps from brewfile
    brew bundle
    print_done
}

setup_env() {
    print_setup "Setting up environment... "
    pwsh install.ps1
    print_done
}

install_homebrew
setup_env
