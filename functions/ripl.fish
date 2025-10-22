function ripl
    set find "$argv[1]"
    set replace "$argv[2]"
    rg "$find" -l | xargs sed -i "s/$find/$replace/g"
end
