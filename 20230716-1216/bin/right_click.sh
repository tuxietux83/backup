#!/bin/bash

### Right click menu with rofi
# options = "Option 1\nOption 1\n...etc"
link=$(xclip -o)
options="YT Download\nPlay with mpv"

# Show options with rofi
selected_option=$(echo -e "$options" | rofi -dmenu -mesg "$link")

# Check the option and run it
case "$selected_option" in
     "YT Download")
         ytdlppath="$HOME/Downloads/yt-dlp"
         yt-dlp -f "bestvideo[height<=1440]+bestaudio/best" -P "$ytdlppath" -q --progress -N 200 "$link"
         ;;
     "Play with mpv")
         mpv "$link"
         ;;
     *)
         ;;
esac
