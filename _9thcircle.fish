if test (hostname) = ninthCircle
    set PATH $PATH ~/.local/bin
    set PATH $PATH ~/repos/ols
    set -gx PLAYDATE_SDK_PATH ~/Developer/PlaydateSDK
    fish_add_path $PLAYDATE_SDK_PATH/bin
    set -gx PDSIM $PLAYDATE_SDK_PATH/bin/Playdate\ Simulator.app/Contents/MacOS/Playdate\ Simulator
    # bun
    set --export BUN_INSTALL "$HOME/.bun"
    set --export PATH $BUN_INSTALL/bin $PATH
    alias hx nvim
end
