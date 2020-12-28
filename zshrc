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
MENU_COMPLETE=true



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



#########################################################################################
# Functions
#########################################################################################
function rubocop_changes() {
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
# Other
#########################################################################################
# Add fzf to shell
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh

# Add to path
export PATH="/usr/local/opt/openjdk/bin:$PATH" # Homebrew's Java

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
