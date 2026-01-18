if test (hostname) = eighthcircle
    # Added by swiftly
    source "/home/maurice/.local/share/swiftly/env.fish"
    # Added by swiftly
    source "/root/.local/share/swiftly/env.fish"
    # Playdate SDK
    set -gx PLAYDATE_SDK_PATH ~/PlaydateSDK
    fish_add_path $PLAYDATE_SDK_PATH/bin
end
