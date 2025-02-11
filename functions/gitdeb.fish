function gitdeb
    set -l message (or $argv[1] "Debugging")
    git add .
    git commit -m $message
    git push origin HEAD
end
