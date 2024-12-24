if status is-interactive
    # Commands to run in interactive sessions can go here
end

set SHELL /usr/local/bin/fish

zoxide init fish | source

alias cd="z"
alias ls='eza --icons=always'
alias ll="ls -la"

#directory vars
set GWD '/Users/mauriceelliott/Library/Application Support/Picotron/drive/desktop/projects/gut_wound'

fzf --fish | source

set fish_greeting "Hello Maurice, what are we working on today?"

clear && neofetch
