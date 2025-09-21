function boot
    set BOOT_FLAG_FILE "$XDG_RUNTIME_DIR/magios_hx_boot_flag"
    if not test -f $BOOT_FLAG_FILE
        touch $BOOT_FLAG_FILE
        hx ~/MAGIos
        return 0
    end

    set BOOT_FLAG_FILE "$XDG_RUNTIME_DIR/gemini_boot_flag"

    if not test -f $BOOT_FLAG_FILE
        touch $BOOT_FLAG_FILE
        NODE_NO_WARNINGS=1 gemini
        clear
        return 0
    end

    set BOOT_FLAG_FILE "$XDG_RUNTIME_DIR/magios_git_boot_flag"
    if not test -f $BOOT_FLAG_FILE
        touch $BOOT_FLAG_FILE
        cd ~/MAGIos
        return 0
    end

    set BOOT_FLAG_FILE "$XDG_RUNTIME_DIR/firefox_boot_flag"

    if not test -f $BOOT_FLAG_FILE
        touch $BOOT_FLAG_FILE
        run_unattended firefox-bin
        btop
        return 0
    end

end
