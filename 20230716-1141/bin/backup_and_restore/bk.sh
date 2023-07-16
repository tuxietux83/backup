#!/bin/bash
#--------- For build testing ----------
# rm -v -r "$folder_path"
# -------------------------------------
# Files and directorie to include in backup
files=(
     .bashrc
     .bash_aliases
     .bash_colors
     bin
     .config/dunst
     .config/geany
     .config/htop
     .config/i3
     .config/mpv
     .config/polybar
     .config/rofi
)
### BackUp script
folder_format=$(date +%Y%m%d-%H%M)
folder_path="$HOME/Documents/backups"
folder="$folder_path/$folder_format"

# Check for backup dir
if [ ! -d "$folder_path" ]; then
   mkdir -v -p "$folder_path"
fi
# Create backup dir by its timestamp
mkdir -v -p "$folder"
# Start to backup
for file in "${files[@]}"; do
    if [ -f "$HOME/$file" ]; then
        echo "$HOME/$file -> ok "
        rsync -av "$HOME/$file" "$folder/"
    elif [ -d "$HOME/$file" ]; then
        echo "$HOME/$file/ -> ok "
        mkdir -v -p "$folder/$file"
        rsync -av "$HOME/$file/" "$folder/$file"
    else
       echo "$HOME/$file -> nok  "
    fi
done

