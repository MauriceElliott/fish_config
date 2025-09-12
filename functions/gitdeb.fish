function gitdeb
    if test -z "$argv[1]"
        git add .
        git commit --fixup HEAD
        git push origin HEAD
    else
        set message $argv[1]
        git add .
        git commit -m "$message"
        git push origin HEAD
    end
end
