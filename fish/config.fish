if status is-interactive
   
    # Specific-fish settings

    set -U fish_greeting "🐟"

    #Add paths

    fish_add_path /usr/local/sbin
    fish_add_path /home/ivan/.cargo/bin
    fish_add_path /Users/ivan/.local/bin

#Aliases
    
    alias cls='clear'
    alias ls='colorls --sd'
    alias 'hcb'='headsetcontrol -b'
    alias cat='bat'
    
#On-startup commands (e.g. neofetch)

    neofetch | lolcat -p 10000
end
