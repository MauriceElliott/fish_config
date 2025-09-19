function boot
    set BOOT_FLAG_FILE "$XDG_RUNTIME_DIR/magios_hx_boot_flag"
    if not test -f $BOOT_FLAG_FILE
        hx ~/MAGIos
        touch $BOOT_FLAG_FILE
        return 0
    end

    set BOOT_FLAG_FILE "$XDG_RUNTIME_DIR/btop_boot_flag"

    if not test -f $BOOT_FLAG_FILE
        btop
        touch $BOOT_FLAG_FILE
        return 0
    end

    set BOOT_FLAG_FILE "$XDG_RUNTIME_DIR/magios_git_boot_flag"
    if not test -f $BOOT_FLAG_FILE
        cd ~/MAGIos
        touch $BOOT_FLAG_FILE
        return 0
    end

end
