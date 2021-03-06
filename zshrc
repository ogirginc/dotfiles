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

source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

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
# Powerlevel10k
#########################################################################################

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f $HOME/.p10k.zsh ]] || source $HOME/.p10k.zsh



#########################################################################################
# Aliases
#########################################################################################
alias .dotfiles="cd $HOME/Dotfiles && nvim -c ':NERDTreeToggle'"
alias .brewrc="nvim $HOME/Dotfiles/Brewfile"
alias .gitconfig="nvim $HOME/Dotfiles/git/config"
alias .nvimrc="nvim $HOME/Dotfiles/nvim/config/init.vimrc"
alias .zshrc="nvim $HOME/Dotfiles/zshrc"



#########################################################################################
# Environment Variables
#########################################################################################
export XDG_CONFIG_HOME="$HOME/.config"
export HOMEBREW_BUNDLE_FILE="$HOME/Dotfiles/Brewfile"
export LANG="en_US.UTF-8"
export EDITOR="nvim"

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



#########################################################################################
# asdf
#########################################################################################
# Add to shell
. $(brew --prefix asdf)/asdf.sh

# Get all available language versions rather than waiting someone to bump it
# https://github.com/asdf-vm/asdf-ruby/commit/af80345be901838ce2c6a58c6536a6fccc573b91
export ASDF_RUBY_BUILD_VERSION=master



#########################################################################################
# Homebrew
#########################################################################################
# Export these to your path because doctor said so! :)
export PATH="/usr/local/opt/openjdk/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

#########################################################################################
# Other
#########################################################################################
# Add fzf to shell
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
