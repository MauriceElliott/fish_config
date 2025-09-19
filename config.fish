set -g fish_history_max 1000000

set -g fish_history_save_on_exit 1

if status is-interactive
    zoxide init fish | source

    alias cd="z"
    alias ls='eza --icons=always'
    alias ll="ls -la"

    fzf --fish | source

    set fish_greeting ""

    clear && fastfetch
    echo ""

    if test -f ~/.config/fish/local_variables.fish
        source ~/.config/fish/local_variables.fish
    end

    export COLORTERM=truecolor
    boot
end
