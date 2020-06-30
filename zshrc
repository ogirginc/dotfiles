################################################################################
# zsh-completions
################################################################################
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



################################################################################
# Powerlevel10k
################################################################################

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f $HOME/.p10k.zsh ]] || source $HOME/.p10k.zsh



################################################################################
# Other
################################################################################
# Add asdf to shell
. $(brew --prefix asdf)/asdf.sh


# Add fzf to shell
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh

# Aliases
alias .nvimrc="nvim $HOME/.config/nvim/config/init.vimrc"
alias .zshrc="nvim $HOME/.config/.zshrc"
alias .brewrc="nvim $HOME/.config/Brewfile"

# ENV exports
export XDG_CONFIG_HOME="$HOME/.config"
export HOMEBREW_BUNDLE_FILE="$HOME/Documents/Programming/Configs/Brewfile"
