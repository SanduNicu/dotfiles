# ALIASES

alias dot="cd $HOME/.dotfiles"
alias dotv="cd $HOME/.dotfiles && nvim ."

alias rld='. ~/.zshrc'
alias v='nvim'
alias r='ranger'
alias p='sudo pacman'
alias y='yay'
alias ka='killall'
alias :q='exit'
alias mk='make'
alias pclean='sudo pacman -Rs $(pacman -Qqtd)'
alias sdn='shutdown now'

alias reload!='. ~/.zshrc'
alias cls='clear' # Good 'ol Clear Screen command
alias tn='tmux new -s'
alias ta='tmux a -t'
alias grub-update='sudo grub-mkconfig -o /boot/grub/grub.cfg'
