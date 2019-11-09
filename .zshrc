# Load Antigen and Powerlevel9k
source ~/.antigenrc
source ~/.powerlevel9k
source ~/.zshenv

# Load Oh My ZSH
antigen use oh-my-zsh

# Load Plugins
antigen bundle git
antigen bundle pip
antigen bundle npm

# Apply powerlevel9k theme
antigen theme bhilburn/powerlevel9k powerlevel9k

# Apply Antigen
antigen apply
