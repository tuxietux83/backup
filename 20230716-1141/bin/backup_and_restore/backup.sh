#!/bin/bash
### BackUp script
folder_format=$(date +%Y%m%d-%H%M)
folder_path="$HOME/Documents/backups"
folder="$folder_path/$folder_format"
#--------- For build testing
rm -v -r "$folder_path"
# --------


# Check fo backup dir
if [ ! -d "$folder_path" ]; then
   mkdir -v -p "$folder_path"
fi
# Creat backup dir by its timestamp
mkdir -v -p "$folder"
## Start to backup
files=(
     $HOME/.bashrc
     $HOME/.bash_aliases
     $HOME/.bash_colors
     $HOME/bin
     $HOME/.config/i3
)
backup_bin_folder="$folder/bin"
mkdir -v -p "$backup_bin_folder"

for file in "${files[@]}"; do
    if [ -f "$file" ]; then
       echo "$file -> ok "
       cp -v -rp "$file" "$folder"
    elif [ -d "$file" ]; then
         subdir="$folder/${file##*/}"
         mkdir -v -p "$subdir"
         cp -v -rp "$file"/* "$subdir"
         echo "$file -> ok "
    else
       echo "$file -> nok  "
    fi
done



# Debugging, after the script its over, you can delete
ls -1 $folder_path
