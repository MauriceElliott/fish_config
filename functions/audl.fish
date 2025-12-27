function audl
    if test (count $argv) -lt 2
        echo "Usage: audl <url> <output-folder>"
        return 1
    end

    set url $argv[1]
    set outdir $argv[2]

    mkdir -p $outdir

    yt-dlp --cookies-from-browser firefox \
        -f bestaudio \
        --extract-audio \
        --audio-format mp3 \
        --audio-quality 0 \
        -o "$outdir/%(title)s.%(ext)s" \
        $url
end
