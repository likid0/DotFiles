autoload -U promptinit

# Autoload zsh modules when they are referenced
zmodload -a zsh/stat stat
zmodload -a zsh/zpty zpty
zmodload -a zsh/zprof zprof
zmodload -ap zsh/mapfile mapfile
zmodload -a zsh/zmv zmv
autoload -U promptinit
# xargs but zargs
autoload -U zargs
# Calculator
autoload zcalc
# Line editor
autoload zed
# Renaming with globbing
autoload zmv
#TZ="America/New_York"
HISTFILE=$HOME/.zhistory
HISTSIZE=1500
SAVEHIST=1500
HOSTNAME="`hostname`"
PAGER='more'
EDITOR='vim'
PATH=$PATH:/home/liquid/bin:/home/liquid/bin/login:/usr/local/bin/:/home/liquid/ICAClient/linuxx86/:/opt/agns/
if [ -f  ~/.dir_colors ]
then
eval `dircolors -b ~/.dir_colors` 
fi

autoload colors zsh/terminfo
    if [[ "$terminfo[colors]" -ge 8 ]]; then
   colors
    fi
    for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
   eval PR_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
   eval PR_LIGHT_$color='%{$fg[${(L)color}]%}'
   (( count = $count + 1 ))
    done
    PR_NO_COLOR="%{$terminfo[sgr0]%}"
PS1="[$PR_BLUE%n$PR_WHITE@$PR_BLUE%m$PR_NO_COLOR:$PR_WHITE%2c$PR_NO_COLOR]%(!.#.$) "
RPS1="$PR_LIGHT_YELLOW(%D{%m-%d %H:%M})$PR_NO_COLOR"




# prompt, colors are defined in host resource file
autoload -U colors
colors

#export http_proxy=http://dpar-00:Daniel01@10.7.180.101:80 
# setopt NOHUP
#setopt NOTIFY
#setopt NO_FLOW_CONTROL
setopt INC_APPEND_HISTORY SHARE_HISTORY
setopt APPEND_HISTORY
# setopt AUTO_LIST              # these two should be turned off
# setopt AUTO_REMOVE_SLASH
# setopt AUTO_RESUME            # tries to resume command of same name
unsetopt BG_NICE                # do NOT nice bg commands
setopt CORRECT                  # command CORRECTION
setopt EXTENDED_HISTORY         # puts timestamps in the history
# setopt HASH_CMDS              # turns on hashing
#
setopt MENUCOMPLETE
setopt ALL_EXPORT

# Set/unset  shell options
setopt   notify globdots correct pushdtohome cdablevars autolist
setopt   correctall autocd recexact longlistjobs
setopt   autoresume histignoredups pushdsilent
setopt   autopushd pushdminus extendedglob rcquotes mailwarning brace_ccl
unsetopt bgnice autoparamslash

# # --------------------------------------------------------------------
# # aliases
# # --------------------------------------------------------------------

alias slrn="slrn -n"
alias f=finger
alias ll='ls -l'
alias lr='ls -ltr'
alias bdf='df -h'
alias 'grep=grep --colour'
alias -s txt=vim
alias -s text=vim
alias -s html=firefox
alias -s org=w3m
alias -s pdf=evince
alias -s doc="/home/liquid/.cxoffice/winxp/desktopdata/cxmenu/Desktop.C^5E3A^5Fusers^5Fcrossover^5FDesktop/WINWORD"
alias -s docx="/home/liquid/.cxoffice/winxp/desktopdata/cxmenu/Desktop.C^5E3A^5Fusers^5Fcrossover^5FDesktop/WINWORD"
alias -s xls="/home/liquid/.cxoffice/winxp/desktopdata/cxmenu/Desktop.C^5E3A^5Fusers^5Fcrossover^5FDesktop/EXCEL"
alias -s jpg=feh
alias -s png=feh
alias -s gif=feh
alias -s chm=chmsee
alias -s mp3="mocp" 
alias -g C='| wc -l'
alias -g M='| more'
alias -g G='| grep -i '
alias -g S=/var/log/messages
alias -g T='tail -1000'
alias -g TF='tail -1000f'
alias cls='clear'
alias ls='ls --color=auto '
# For convenience
alias 'mkdir=mkdir -p'
alias 'dus=du -ms * | sort -n'
alias -g N='> /dev/null'
alias S="sudo"
alias LO="xscreensaver-command -lock"
alias usb="mount /media/usb"
alias 3G="sakis3g --sudo connect OTHER="USBMODEM" SIM_PIN="XXXX" APN="internet" --console"
alias 3GOFF="sakis3g --sudo disconnect OTHER="USBMODEM" SIM_PIN="XXXX" APN="internet" --console"





#chpwd

autoload -U compinit
autoload -U zfinit
zfinit


compinit
bindkey "^?" backward-delete-char
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
bindkey '^[[5~' up-line-or-history
bindkey '^[[6~' down-line-or-history
bindkey "^r" history-incremental-search-backward
bindkey ' ' magic-space    # also do history expansion on space
bindkey '^I' complete-word # complete on tab, leave expansion to _expand
bindkey '^i' expand-or-complete-prefix
bindkey '^D' backward-delete-word # alt + BACKSPACE  delete word backward
bindkey '^da' delete-word      # alt + DELETE  delete word forward
bindkey '^l' push-line
bindkey "^B" run-help
bindkey -M viins '^r' history-incremental-search-backward
bindkey -M vicmd '^r' history-incremental-search-backward
bindkey -M viins '^a' beginning-of-line
bindkey -M vicmd '^a' beginning-of-line

autoload -U tetris
zle -N tetris
bindkey '^k' tetris

zstyle ':completion:*:*:xdvi:*' menu yes select
zstyle ':completion:*:*:xdvi:*' file-sort time
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric
zstyle ':completion:*:functions' ignored-patterns '_*'

if test "$TERM" = "xterm" -o \
        "$TERM" = "xterm-color" -o \
        "$TERM" = "xterm-256color" -o \
        "$TERM" = "rxvt" -o \
        "$TERM" = "rxvt-unicode" -o \
        "$TERM" = "xterm-xfree86"; then
	precmd () {print -Pn "\e]0;%m@%n:%~\a"}
fi

