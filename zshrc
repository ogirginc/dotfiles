#########################################################################################
# zsh-completions
#########################################################################################
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

	# Initialize the zsh completion system
	# http://zsh.sourceforge.net/Doc/Release/Completion-System.html#Completion-System
  autoload -Uz compinit
  compinit


	# case insensitive path-completion
	# https://scriptingosx.com/2019/07/moving-to-zsh-part-5-completions/
	zstyle ':completion:*' matcher-list \
		'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' \
		'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' \
		'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' \
		'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

fi

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=243'
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_USE_ASYNC=trug
MENU_COMPLETE=true



#########################################################################################
# ZSH History Settings
#########################################################################################
# History location.
export HISTFILE=~/.zsh_history

# It’s not possible to set the history to an unlimited size in zsh. The max
# history size can be the value of LONG_MAX variable from limits.h header,
# which is 9223372036854775807.
export HISTFILESIZE=9223372036854775800
export HISTSIZE=9223372036854775800

# Maximum number of items for the history file
export SAVEHIST=9223372036854775800

# The meaning of these options can be found in man page of `zshoptions`.
setopt HIST_IGNORE_ALL_DUPS  # do not put duplicated command into history list
setopt HIST_SAVE_NO_DUPS  # do not save duplicated command
setopt HIST_REDUCE_BLANKS  # remove unnecessary blanks
setopt INC_APPEND_HISTORY_TIME  # append command to history file immediately after execution

# Append history without exiting shell.
setopt inc_append_history
export HISTTIMEFORMAT="[%F %T] "

# Add Timestamp to history.
setopt extended_history

# When searching, skip duplicates and show each command only once.
setopt hist_find_no_dups

# To retrieve the history file everytime history is called upon. The only
# caveat is the need to press enter to fetch history.
setopt share_history



#########################################################################################
# ShellHistory App
#########################################################################################
# Adding shhist to PATH, so we can use it from Terminal
PATH="${PATH}:/Applications/ShellHistory.app/Contents/Helpers"

# creating an unique session id for each terminal session
__shhist_session="${RANDOM}"

# prompt function to record the history
__shhist_prompt() {
    local __exit_code="${?:-1}"
    \history -D -t "%s" -1 | sudo --preserve-env --user ${SUDO_USER:-${LOGNAME}} shhist insert --session ${TERM_SESSION_ID:-${__shhist_session}} --username ${LOGNAME} --hostname $(hostname) --exit-code ${__exit_code} --shell zsh
    return ${__exit_code}
}

# integrating prompt function in prompt
precmd_functions=(__shhist_prompt $precmd_functions)



#########################################################################################
# Powerlevel10k
#########################################################################################

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f $HOME/.p10k.zsh ]] || source $HOME/.p10k.zsh



#########################################################################################
# Aliases
#########################################################################################
alias .dotfiles="cd $HOME/Dotfiles && nvim -c ':Neotree'"
alias .brewrc="nvim $HOME/Dotfiles/Brewfile"
alias .gitconfig="nvim $HOME/Dotfiles/git/config"
alias .nvimrc="nvim $HOME/Dotfiles/nvim/init.lua"
alias .zshrc="nvim $HOME/Dotfiles/zshrc"
alias .history="nvim $HOME/.zsh_history"

alias nvim-lazy="NVIM_APPNAME=lazyvim nvim"

# Show all the history stored with fzf.
alias history="fc -l 1 | fzf"


#########################################################################################
# Environment Variables
#########################################################################################
export XDG_CONFIG_HOME="$HOME/.config"
export HOMEBREW_BUNDLE_FILE="$HOME/Dotfiles/Brewfile"
export LANG="en_US.UTF-8"
export EDITOR="nvim"
export PATH="$PATH:$HOME/.exo/bin" # https://github.com/deref/exo

source "$HOME/Documents/Dotfiles/env-vars.sh"



#########################################################################################
# Functions
#########################################################################################
function rubocop_changes() {
  git status --porcelain | sed s/^...// | xargs rubocop
}

function bundle_rubocop_changes() {
  git status --porcelain | sed s/^...// | xargs bundle exec rubocop
}

function rz() {
  echo "sourcing ~/.zshrc"
  source ~/.zshrc
}

function fixadguard() {
  sudo ifconfig lo0 up
}



#########################################################################################
# asdf
#########################################################################################
# Add to shell
. $(brew --prefix asdf)/libexec/asdf.sh

# Get all available language versions rather than waiting someone to bump it
# https://github.com/asdf-vm/asdf-ruby/commit/af80345be901838ce2c6a58c6536a6fccc573b91
export ASDF_RUBY_BUILD_VERSION=master



#########################################################################################
# Homebrew
#########################################################################################
# Export these to your path because doctor said so! :)
export PATH="/usr/local/opt/openjdk/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

# To be able to access psql
# export PATH="/opt/homebrew/opt/postgresql@11/bin:$PATH"

#########################################################################################
# Other
#########################################################################################
# Add fzf to shell
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
