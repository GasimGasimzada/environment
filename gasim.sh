source $HOME/.gasim-env

if [ -n "$ZSH_VERSION" ]; then
    export GASIM_SHELL="zsh"
elif [ -n "$BASH_VERSION" ]; then
    export GASIM_SHELL="bash"
else
    echo "Unknown shell"
    return 1 2>/dev/null || exit 1
fi

export GASIM_ENV=$HOME/.config/gasim
export OMP_CACHE_DIR=$GASIM_ENV/.cache

eval "$(oh-my-posh --init --shell $GASIM_SHELL --config $GASIM_ENV/gasim.omp.json)"
eval "$(fnm env --use-on-cd --shell $GASIM_SHELL)"
eval "$(zoxide init $GASIM_SHELL)"
eval "$(atuin init $GASIM_SHELL)"

if [ "$GASIM_SHELL" = "zsh" ]; then
    autoload -Uz compinit && compinit
    zstyle ":completion:*" menu select
elif [ "$GASIM_SHELL" = "bash" ]; then
    bind 'set show-all-if-ambiguous on'
    bind 'TAB:menu-complete'
fi

alias cd="z"
