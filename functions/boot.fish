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
        firefox-bin
        return 0
    end

    set BOOT_FLAG_FILE "$XDG_RUNTIME_DIR/btop_boot_flag"

    if not test -f $BOOT_FLAG_FILE
        touch $BOOT_FLAG_FILE
        btop
        return 0
    end

end
