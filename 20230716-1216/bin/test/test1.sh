#!/bin/bash
# yt-dlp pasing argument function for alias

ytt() {
    ytdlppath="$HOME/Downloads/yt-dlp"
    cd $ytdlppath
    yt-dlp -f "bestvideo[height<=1440]+bestaudio/best" -P "$ytdlppath" -q --progress -N 200 "$1" "$2"
}
