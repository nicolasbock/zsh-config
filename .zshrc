# History.
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

# Set options.
setopt autocd extendedglob nomatch notify

# Be quiet.
unsetopt beep

# Emacs key bindings.
bindkey -e

# Initialize completion.
zstyle :compinstall filename '/home/nbock/.zshrc'
autoload -Uz compinit
compinit

# Set up fuzzy completion.
#
# 0 -- vanilla completion (abc => abc)
# 1 -- smart case completion (abc => Abc)
# 2 -- word flex completion (abc => A-big-Car)
# 3 -- full flex completion (abc => ABraCadabra)
zstyle ':completion:*' matcher-list '' \
  'm:{a-z\-}={A-Z\_}' \
  'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' \
  'r:|?=** m:{a-z\-}={A-Z\_}'

# Get powerline (apt install powerline)
powerline-daemon -q
source /usr/share/powerline/bindings/zsh/powerline.zsh

[[ -f ~/.zsh_aliases ]] && source ~/.zsh_aliases
[[ -f ~/.dircolors ]] && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

# Define some useful functions.
ediff() {
  if (( $# == 2 )); then
    echo "comparing 2 files"
    emacsclient --create-frame --no-wait --alternate-editor='' --eval "(ediff \"$1\" \"$2\")"
  else
    echo "incorrect number of arguments"
  fi
}

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

# Set up syntax highlighting (zsh-syntax-highlighting).
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Set up autosuggestions (zsh-autosuggestions).
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Set up zplug.
source /usr/share/zplug/init.zsh

# Load zplug plugins.
[[ -f ~/.zplug/packages.zsh ]] && source ~/.zplug/packages.zsh

# Local Variables:
# mode: sh
# End:
