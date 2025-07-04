################
## Shell Rice ##
################
$env.config = {
  show_banner: false,
}

#########################
## Command Replacments ##
#########################
alias clr = clear

alias pvpnc = do { ~/.config/nushell/launch nm-applet ; ~/.config/nushell/launch protonvpn-app }
alias pvpnd = do { pkill nm-applet ; pkill protonvpn-app }

alias fetch = fastfetch
# alias launch = ~/.config/nushell/launch
