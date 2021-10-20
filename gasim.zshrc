# Load Antigen and Powerlevel9k
source ~/.gasim-env/.antigenrc
source ~/.gasim-env/.nvmrc

# Load Oh My ZSH
antigen use oh-my-zsh

# Load Plugins
antigen bundle git
antigen bundle pip
antigen bundle npm
antigen bundle zsh-users/zsh-syntax-highlighting

# Apply Antigen
antigen apply

# Init Oh-my-posh
eval "$(oh-my-posh --init --shell zsh --config ~/.gasim-env/gasim.omp.json)"

source ~/.gasim-env/env.zsh