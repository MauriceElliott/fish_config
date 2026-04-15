if test (hostname) = eighthcircle
    # Playdate SDK
    set -gx PLAYDATE_SDK_PATH ~/PlaydateSDK
    fish_add_path $PLAYDATE_SDK_PATH/bin
    set -gx PDSIM $PLAYDATE_SDK_PATH/bin/PlaydateSimulator
    set PATH $PATH ~/repos/ols
end
