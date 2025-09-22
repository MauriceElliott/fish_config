function boot_check
    if not test -z "$argv[1]"
        set INPUT $argv[1]
    else
        set INPUT ""
    end

    if not test -z "$argv[2]"
        set FILE $argv[2]
    else
        set FILE ""
    end

    if test -z "$argv[3]"
        set CMD $argv[3]
    else
        set CMD ""
    end

    if test -z "$INPUT"
        if not test -f "$FILE"
            touch $FILE
            true
        else
            false
        end
    else
        if "$INPUT" = "$CMD"
            true
        else
            false
        end
    end
    false
end

function boot --description "Function to boot core workflow pieces from"
    # Usage: boot "name_of_workflow_piece"

    if not test -z "$argv[1]"
        echo "arg set"
        set INPUT $argv[1]
    else
        echo "arg not set"
        set INPUT ""
    end

    if boot_check "$INPUT" "$XDG_RUNTIME_DIR/magios_hx_boot_flag" h
        echo "hx returns true"
        cd ~/MAGIos
        hx ~/MAGIos/
        return 0
    end

    if boot_check "$INPUT" "$XDG_RUNTIME_DIR/gemini_boot_flag" gem
        cd ~/MAGIos
        NODE_NO_WARNINGS=1 gemini
        clear
        return 0
    end

    if boot_check "$INPUT" "$XDG_RUNTIME_DIR/magios_git_boot_flag" mgit
        touch $BOOT_FLAG_FILE
        cd ~/MAGIos
        return 0
    end

    if boot_check "$INPUT" "$XDG_RUNTIME_DIR/firefox_boot_flag" ff
        run_unattended firefox-bin
        btop
        return 0
    end
end
