export GASIM_ENV=$HOME/.config/gasim
export PATH=$PATH:$GASIM_ENV/bin/zsh

eval "$(oh-my-posh --init --shell zsh --config $GASIM_ENV/gasim.omp.json)"
eval "$(fnm env --use-on-cd --shell zsh)"
