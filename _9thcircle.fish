if test (hostname) = ninthCircle
    set PATH $PATH ~/.local/bin
    set -gx PLAYDATE_SDK_PATH ~/Developer/PlaydateSDK
    fish_add_path $PLAYDATE_SDK_PATH/bin
end
