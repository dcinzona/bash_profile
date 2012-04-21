[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

##
# Your previous /Users/gmt/.bash_profile file was backed up as /Users/gmt/.bash_profile.macports-saved_2011-12-05_at_18:29:22
##

# MacPorts Installer addition on 2011-12-05_at_18:29:22: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.
export iOSOpenDevPath=/opt/iOSOpenDev
export iOSOpenDevDevice=
export PATH=/opt/iOSOpenDev/bin:$PATH

#RELOAD THIS FILE
alias reload="source ~/.bash_profile"

#backup this profile
alias bup="cp ~/.bash_profile ~/Dropbox/_BACKUP"

#Backup any file to Dropbox/_BACKUP
cpBackup()
{
cp $1 ~/Dropbox/_BACKUP/
}
alias backup=cpBackup

alias profile="mate ~/.bash_profile"
alias f="mdfind"
#alias find="mdfind" #CONFLICTS WITH CLEANUP

# Easier navigation: .., ..., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"

# Shortcuts
alias d="cd ~/Dropbox"
alias i="cd ~/Dropbox/iPhone"
alias g="cd ~/Dropbox/git"
alias o="open"
alias oo="open ."
alias m="mate ."
alias colors="~/Dropbox/showColors.sh"
alias exp="open ~/Dropbox/_Documents/_Taxes/Expenses.xlsx"

# List all files colorized in long format
alias dir="ls -ahl"
alias l="ls -Gl"
alias ls="ls -G"

# List all files colorized in long format, including dot files
alias la="ls -Gla"
alias lsa="ls -Gla"

# List only directories
alias lsd='ls -Gl | grep "^d"'

# Enable aliases to be sudo’ed
alias sudo='sudo '

# Get OS X Software Updates, update Homebrew itself, and upgrade installed Homebrew packages
alias update='sudo softwareupdate -i -a; brew update; brew upgrade'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias lanip="ipconfig getifaddr en1"
alias ipl="ipconfig getifaddr en1"
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

# Enhanced WHOIS lookups
alias whois="whois -h whois-servers.net"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Canonical hex dump; some systems have this symlinked
type -t hd > /dev/null || alias hd="hexdump -C"

# OS X has no `md5sum`, so use `md5` as a fallback
type -t md5sum > /dev/null || alias md5sum="md5"

# Remove Directory -force
alias rmd="rm -R ."

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"
alias clean="find . -type f -name '*.DS_Store' -ls -delete"


# Empty the Trash on all mounted volumes and the main HDD
# Also, clear Apple’s System Logs to improve shell startup speed
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.Finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.Finder AppleShowAllFiles -bool false && killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'


# PROMPT Styling
# @gf3’s Sexy Bash Prompt, inspired by “Extravagant Zsh Prompt”
# Shamelessly copied from https://github.com/gf3/dotfiles
# Screenshot: http://i.imgur.com/s0Blh.png


	MAGENTA=""
	COMPUTER="\033[0;33m"
	BLUE="\033[0;34m"
	GREEN="\033[0;32m"
	PURPLE="\033[4:35m"
	WHITE="\033[0;37m"
	USER="\033[0;31m"
	RESET="\033[m"

export MAGENTA
export COMPUTER
export BLUE
export GREEN
export PURPLE
export WHITE
export USER
export RESET

function parse_git_dirty() {
	[[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}

function parse_git_branch() {
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

PS1="\[$USER\]\u \[$RESET\]at \[$COMPUTER\]\h \[$RESET\]in \[$BLUE\]\w\[$PURPLE\]\n\$ \[$RESET\]"