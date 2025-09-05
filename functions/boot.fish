# issue with wifi card not waking up and using sways exec doesn't seem to work so need a quick way of running this to wake up wifi.
function boot
    set BOOT_FLAG_FILE "/tmp/"(whoami)"_boot_flag"

    if not test -f $BOOT_FLAG_FILE
        sudo iw dev wlp13s0 scan
        touch $BOOT_FLAG_FILE
    end
end
