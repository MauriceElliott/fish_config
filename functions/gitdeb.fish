function gitdeb
    if test -z "$argv[1]"
        set message debugging
    else
        set message $argv[1]
    end
    git add .
    git commit -m "$message"
    git push origin HEAD
end
