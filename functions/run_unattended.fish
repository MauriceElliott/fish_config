function run_unattended
    set -l cmd "$argv[1]"
    set -l ts (date +%Y%m%d-%H%M%S)
    set -l log "/tmp/run_unattended-$ts.log"

    nohup fish -c "$cmd" >$log 2>&1 </dev/null &
    set -l pid $last_pid
    disown $pid

    echo "Started: $cmd"
    echo "PID: $pid"
    echo "Log: $log"
end
