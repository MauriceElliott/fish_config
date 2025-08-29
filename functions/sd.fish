# issue with wifi card not waking up and using sways exec doesn't seem to work so need a quick way of running this to wake up wifi.
function sd
    sudo iw dev wlp13s0 scan
end
