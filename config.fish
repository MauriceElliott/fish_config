set -g fish_history_max 1000000

set -g fish_history_save_on_exit 1

if status is-interactive
    if not set -q ZELLIJ
        # zellij attach --create main
    end
    zoxide init fish | source

    alias cd="z"
    alias ls='eza --icons=always'
    alias ll="ls -la"
    alias gist="git status"
    alias gip="git pull origin HEAD && git fetch"

    fzf --fish | source

    set fish_greeting ""

    sleep 0.1 #fixes a load of issues with fast fetch, not really sure why, but it seems to be consistent across terminals and OS's that adding this solves a lot of issues

    if test -f ~/.config/fish/local_variables.fish
        source ~/.config/fish/local_variables.fish
    end

    source ~/.config/fish/_taclaptop.fish
    source ~/.config/fish/_eighthcircle.fish
    source ~/.config/fish/_9thcircle.fish

    # export COLORTERM=truecolor

    clear && fastfetch
    echo ""

    jdi
    echo ""
end
