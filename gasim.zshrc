export GASIM_ENV=$HOME/.config/gasim
export PATH=$PATH:$GASIM_ENV/bin/zsh
export OMP_CACHE_DIR=$GASIM_ENV/.cache

eval "$(oh-my-posh --init --shell zsh --config $GASIM_ENV/gasim.omp.json)"
eval "$(fnm env --use-on-cd --shell zsh)"
