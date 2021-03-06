# Switch external VGA port for beamer
alias beamer-on='xrandr --output VGA1 --mode 1024x768 --left-of LVDS1'
alias beamer-off='xrandr --output LVDS1 --mode 1600x900 --output VGA1 --off'

# rshell, for micropython development on ESP32
alias rshell="rshell --buffer-size=30 -p /dev/ttyUSB0"

# colors for ls
alias ls='ls --color=auto'

# show octal file permissions
alias lso='stat -c "%n %a" *'

# vi, vim should always run neovim
alias v='nvim'
alias vi='nvim'
alias vim='nvim'

# dotfile aliases
alias update-dotfiles='cd ~/.config/dotdrop/ && git add -A && git commit -m "update dotfiles" && git push'
