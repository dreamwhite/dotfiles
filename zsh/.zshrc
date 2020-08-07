# BASIC ZSH STUFF
export ZSH="$HOME/.oh-my-zsh"
export HISTTIMEFORMAT='%F %T'
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
ZSH_DISABLE_COMPFIX=true
setopt list_ambiguous
if [[ $TERM == dumb ]]; then
    unset zle_bracketed_paste
else
    autoload -Uz bracketed-paste-magic
    zle -N bracketed-paste bracketed-paste-magic
fi
# THEME CONFIGURATION
export POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs ssh)
export POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir)
source  ~/.zshsh/powerlevel9k/powerlevel9k.zsh-theme

# PLUGINS 
plugins=(
    history
    command-not-found
    )


source $ZSH/oh-my-zsh.sh
source ~/.zshsh/zsh-syntax-highlighting.zsh
source $(dirname $(gem which colorls))/tab_complete.sh


# ALIASES
alias my='mysql -uroot -p $1'
alias backup_docker='docker save $1 -o backup.zip'
alias start_portainer='docker start portainer'
alias ..='cd ..'
alias remcrash='sudo rm -r /var/crash/*'
alias empty='echo >'
alias backup_apache2_config='zip -r -0 apache2_config.zip /etc/apache2'
alias backup_mariadb='zip -r -0 mysql_config.zip /etc/mysql'
alias cls='clear'
alias ls='colorls --sd'
alias 'git clone'="git clone https://github.com/"

dump_db() {
	mysqldump -u root -p "$1" > "$1.sql"
}

extract () {
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar xvjf $1    ;;
           *.tar.gz)    tar xvzf $1    ;;
           *.bz2)       bunzip2 $1     ;;
           *.rar)       unrar x $1       ;;
           *.gz)        gunzip $1      ;;
           *.tar)       tar xvf $1     ;;
           *.tbz2)      tar xvjf $1    ;;
           *.tgz)       tar xvzf $1    ;;
           *.zip)       unzip $1       ;;
           *.Z)         uncompress $1  ;;
           *.7z)        7z x $1        ;;
           *)           echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
 }

list_db() {
	mysql -u root -p -e "show databases;"
}

function repeat() # Syntax: "repeat [X] [command]"  
{
    local i max
    max=$1; shift;
    for ((i=1; i <= max ; i++)); do  # --> C-like syntax
        eval "$@";
    done
}
source $(dirname $(gem which colorls))/tab_complete.sh
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

