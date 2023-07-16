#!/usr/bin/bash
unalias -a # Unset all aliases
EDITOR=nano
alias e=$EDITOR

# Check for colors
if [[ -f ~/.bash_colors ]]; then
  . ~/.bash_colors
else
  echo ".bash_colors: Doesn't exist"
fi

## Aliases
# exa -list options
if command -v exa &>/dev/null; then
	alias lsl="exa --icons --group-directories-first -alF"		# List long format
	alias lss="exa --icons --group-directories-first -aF"		# List short format
	alias lsd="exa --icons -aDF"					# List directories
	alias ls="exa --icons --group-directories-first"		# Ls
	echo -e "$yellow exa$reset:$green 󰗠$reset"
else
	echo -e "$yellow exa$reset: $red not installed$reset!"
fi
# Batcat, cat with colors
if command -v batcat &>/dev/null; then
	alias cat="batcat --theme=Coldark-Dark --paging=never --style=plain,header,grid"
	echo -e "$yellow batcat$reset:$green 󰗠$reset"
else
	echo -e "$yellow batcat$reset: $red not installed$reset!"
fi
# Intel gpu top
if command -v intel_gpu_top &>/dev/null;then
	alias itop="sudo intel_gpu_top"		# Intel gpu top
	echo -e "$yellow intel_gpu_top$reset:$green 󰗠$reset"
else
	echo -e "$yellow intel_gpu_top$reset: $red not installed$reset!"
fi
# yt-dlp, video downloader
if command -v yt-dlp &>/dev/null; then
    ytdlppath=$HOME/Downloads/yt-dlp
         if [[ ! -d "$ytdlppath" ]]; then
             mkdir -p $ytdlppath
         fi
    yt() {
        cd $ytdlppath
        yt-dlp -f "bestvideo[height<=1440]+bestaudio/best" -P "$ytdlppath" -q --progress -N 200 "$1"
            if [ $? -eq 0 ]; then
                mpv "$(/usr/bin/ls -t * | head -n 1)"
            else
                rm -v "$(/usr/bin/ls *.part | head -n 1)"
                echo "$red Aborted$reset!"
            fi
          }
    #alias yt="cd $ytdlppath && yt-dlp -f 'bestvideo[height<=1440]+bestaudio/best' -P $ytdlppath -q --progress -N 200"
    echo -e "$yellow yt-dlp$reset:$green 󰗠$reset"
else
    echo -e "$yellow yt-dlp$reset: $red not installed$reset!"
fi


# grep
alias grep="grep -i"
# Verbose rm
alias rm="rm -v"

# Edit configs
alias ebash='$EDITOR $HOME/.bashrc &&\
                       source $HOME/.bashrc &&\
                       echo -e "$green $HOME/.bashrc$reset: saved and reloaded ..."'
alias ealiases='$EDITOR $HOME/.bash_aliases &&\
                           source $HOME/.bash_aliases &&\
                           echo -e "$green $HOME/.bash_aliases$reset: saved and reloaded ..."'
alias ei3config='$EDITOR $HOME/.config/i3/config &&\
                            echo -e "$green $HOME/.config/i3/config$reset: was edited ..."'

# APT aliases
alias update="sudo apt update &&\
                         sudo apt list --upgradable"
alias upgrade="sudo apt update &&\
                            clear &&\
                            sudo apt list --upgradable -a &&\
                            read -r -p \"Press ENTER to continue or Ctrl+C to abort\" &&\
                            sudo apt -y upgrade"
alias clean="sudo apt autoremove"
alias as="sudo apt search"

# Font manipulation
alias fc-update="fc-cache -fv"

