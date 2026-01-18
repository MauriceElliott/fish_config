if test (hostname) = ninthCircle
    set PATH $PATH ~/.local/bin
    set -gx PLAYDATE_SDK_PATH ~/Developer/PlaydateSDK
    fish_add_path $PLAYDATE_SDK_PATH/bin
    set -gx PDSIM $PLAYDATE_SDK_PATH/bin/Playdate\ Simulator.app/Contents/MacOS/Playdate\ Simulator
end
