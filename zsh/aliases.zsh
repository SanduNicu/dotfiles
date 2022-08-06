# ALIASES

alias dot="cd $HOME/.dotfiles && v"

alias v='nvim'
alias nv='nvim'
alias ka='killall'
alias :q='exit'
alias mk='make'
alias sdn='shutdown now'
alias rld='. ~/.zshrc'
alias cls='clear'
alias tn='tmux new -s'
alias ta='tmux a -t'

alias gpushf='git push --force'
alias gcw='git commit -m wip'
alias gcwnv='git commit -m wip --no-verify'
alias gfa='git fetch --all'
alias nrw='npm run watch'

# hacks
# alias gitk="sed -i .bak 's/zoomed/normal/g' ~/.config/git/gitk && /usr/local/bin/gitk"


gpullf() {
  if [ -z "$1" ]
    then
      git fetch --all && git reset --hard $(git branch --show-current);
    else
      git fetch --all && git reset --hard origin/${1};
  fi

}

grbh() {
  git rebase -i HEAD~${1};
}
