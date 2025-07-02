################
## Shell Rice ##
################
$env.config = {
  show_banner: false,
}

# if ("~/.cache/starship/init.nu" | path exists ) {
#   use ~/.cache/starship/init.nu # starship  init nu | save ~/.cache/starship/init.nu
#   $env.STARSHIP_CONFIG = '~/.config/nushell/starship.toml'
# }

# cat ~/.cache/wallust/sequences

#########################
## Command Replacments ##
#########################
alias clr = clear

# alias icat = meh

alias pvpnc = do { ~/.config/nushell/launch nm-applet ; ~/.config/nushell/launch protonvpn-app }
alias pvpnd = do { pkill nm-applet ; pkill protonvpn-app }

# if ("~/.zoxide.nu" | path exists) {
  # source ~/.zoxide.nu
# } else {
#   zoxide init nushell | save -f ~/.zoxide.nu | ignore
# }

alias fetch = fastfetch
# alias launch = ~/.config/nushell/launch

# alias useless = do { pacman -Qqd | pacman -Rsu --print - }

########################
## Command Completion ##
########################
# let carapace_completer = {|spans|
#     carapace $spans.0 nushell ...$spans | from json
# }

# $env.config = {
#   completions: {
#     external: {
#       enable: true
#       completer: $carapace_completer
#     }
#   }
# }
