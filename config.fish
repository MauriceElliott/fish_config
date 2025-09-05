set SHELL /usr/local/bin/fish

set -g fish_history_max 1000000

set -g fish_history_save_on_exit 1

zoxide init fish | source

alias cd="z"
alias ls='eza --icons=always'
alias ll="ls -la"
alias swiftc="swiftc -use-ld=bfd"

fzf --fish | source

set fish_greeting ""

sleep 0.1
clear && fastfetch
echo ""
alias passgen='dd if=/dev/urandom bs=1 count=32 2>/dev/null | base64 -w 0 | rev | cut -b 2- | rev'
set -x LD_LIBRARY_PATH ~/swift/swift-5.3/bin $LD_LIBRARY_PATH

if test -f ~/.config/fish/local_variables.fish
    source ~/.config/fish/local_variables.fish
end

boot

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
