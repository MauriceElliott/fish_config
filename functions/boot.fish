function boot --description "Function to boot core workflow pieces"
    if test -z "$argv[1]"
        _boot_all_nodes
    else
        _boot_single_node $argv[1] --force
    end
end

function _boot_all_nodes --description "Boot all workflow nodes that haven't been started"
    set nodes hx gem git ff

    for node in $nodes
        _boot_single_node $node
    end
end

function _boot_single_node --description "Boot a specific workflow node"
    # Usage: _boot_single_node <node_name> [--force]
    set node_name $argv[1]
    set force_mode (contains -- --force $argv)

    switch $node_name
        case hx
            set BOOT_FLAG_FILE "$XDG_RUNTIME_DIR/magios_hx_boot_flag"
            if test $force_mode -eq 0; and test -f $BOOT_FLAG_FILE
                return 0
            end
            touch $BOOT_FLAG_FILE
            cd ~/MAGIos
            hx ./

        case gem
            set BOOT_FLAG_FILE "$XDG_RUNTIME_DIR/gemini_boot_flag"
            if test $force_mode -eq 0; and test -f $BOOT_FLAG_FILE
                return 0
            end
            touch $BOOT_FLAG_FILE
            cd ~/MAGIos
            NODE_NO_WARNINGS=1 gemini
            clear

        case git
            set BOOT_FLAG_FILE "$XDG_RUNTIME_DIR/magios_git_boot_flag"
            if test $force_mode -eq 0; and test -f $BOOT_FLAG_FILE
                return 0
            end
            touch $BOOT_FLAG_FILE
            cd ~/MAGIos

        case ff
            set BOOT_FLAG_FILE "$XDG_RUNTIME_DIR/firefox_boot_flag"
            if test $force_mode -eq 0; and test -f $BOOT_FLAG_FILE
                return 0
            end
            touch $BOOT_FLAG_FILE
            run_unattended firefox-bin
            btop

        case '*'
            echo "Unknown node: $node_name"
            echo "Available nodes: hx, gem, git, ff"
            return 1
    end
end
