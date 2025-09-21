function record_gif --description "Minimal Wayland region -> GIF (grim + slurp + ffmpeg)"
    # Usage: record_gif [fps] [width]
    set -l fps 25
    set -l width ""
    test (count $argv) -ge 1; and set fps $argv[1]
    test (count $argv) -ge 2; and set width $argv[2]

    for cmd in grim slurp ffmpeg
        type -q $cmd; or begin
            echo "Missing dependency: $cmd" >&2
            return 1
        end
    end

    set -l sel (slurp -f '%x,%y %wx%h')
    test -z "$sel"; and echo "Canceled." >&2; and return 1

    set -l xy (echo $sel | awk '{print $1}')
    set -l wh (echo $sel | awk '{print $2}')
    set -l x (echo $xy | cut -d',' -f1)
    set -l y (echo $xy | cut -d',' -f2)
    set -l w (echo $wh | cut -d'x' -f1)
    set -l h (echo $wh | cut -d'x' -f2)
    set -l geometry (printf "%s,%s %sx%s" $x $y $w $h)

    set -l stamp (date +%Y%m%d_%H%M%S)
    set -l raw "/tmp/rg_$stamp.mkv"
    set -l palette "/tmp/rg_$stamp.png"
    set -l out "gif_$stamp.gif"

    echo "Recording $w"x"$h @ $fps fps. Ctrl+C to stop."

    begin
        while true
            grim -t ppm -g $geometry - 2>/dev/null; or break
            sleep (math 1 / $fps)
        end
    end | ffmpeg -loglevel error -y -f image2pipe -framerate $fps -i - -c:v libx264rgb -crf 0 -preset ultrafast $raw
    or begin
        echo "Recording aborted." >&2
        test -f $raw; and rm -f $raw
        return 1
    end

    set -l scalef "scale=iw:-2:flags=lanczos"
    test -n "$width"; and set scalef "scale=$width:-2:flags=lanczos"

    ffmpeg -loglevel error -y -i $raw -vf "fps=$fps,$scalef,palettegen" $palette
    ffmpeg -loglevel error -y -i $raw -i $palette -lavfi "fps=$fps,$scalef,paletteuse=dither=bayer" $out
    or begin
        echo "GIF conversion failed." >&2
        return 1
    end

    type -q gifsicle; and gifsicle -O3 $out -o $out 2>/dev/null

    echo "Saved $out"
    ls -lh $out
end
