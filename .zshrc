# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd extendedglob nomatch notify
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/nbock/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall

ediff() {
  if (( $# == 2 )); then
    echo "comparing 2 files"
    emacsclient --create-frame --no-wait --alternate-editor='' --eval "(ediff \"$1\" \"$2\")"
  else
    echo "incorrect number of arguments"
  fi
}

# Get powerline (apt install powerline)
powerline-daemon -q
. /usr/share/powerline/bindings/zsh/powerline.zsh

[[ -f ~/.zsh_aliases ]] && . ~/.zsh_aliases
[[ -f ~/.dircolors ]] && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

# Stop words at path separators.
WORDCHARS="${WORDCHARS:s#/#}"

# Stop words at '.' for filename suffix.
WORDCHARS="${WORDCHARS:s/./}"

#export EDITOR=vim
export EDITOR="emacsclient --create-frame --alternate-editor=''"
export VISUAL="emacsclient --create-frame --alternate-editor=''"

export MAILDIR=~/Mail
export MU_HOME=~/Mail

export CLIFF_FIT_WIDTH=1

# Local Variables:
# mode: sh
# End:
