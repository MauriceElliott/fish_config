if status is-interactive
    # Commands to run in interactive sessions can go here
end

set SHELL /usr/local/bin/fish

zoxide init fish | source

alias cd="z"
alias ls='eza --icons=always'
alias ll="ls -la"
alias swiftc="swiftc -use-ld=bfd"

#directory vars
set GWD '/Users/mauriceelliott/Library/Application Support/Picotron/drive/desktop/projects/gut_wound'

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
