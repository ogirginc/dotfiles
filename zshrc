###############################################################################
# ShellHistory App
###############################################################################

# adding shhist to PATH, so we can use it from Terminal
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
# Aliases
#########################################################################################
alias .dotfiles="cd $HOME/Dotfiles && nvim -c ':Neotree'"
alias .brewrc="nvim $HOME/Dotfiles/Brewfile"
alias .gitconfig="nvim $HOME/Dotfiles/git/config"
alias .nvimrc="nvim $HOME/Dotfiles/nvim/init.lua"
alias .zshrc="nvim $HOME/Dotfiles/zshrc"
alias .history="nvim $HOME/.zsh_history"

# Show all the history stored with fzf.
alias history="fc -l 1 | fzf"



#########################################################################################
# Environment Variables
#########################################################################################
export XDG_CONFIG_HOME="$HOME/.config"
export HOMEBREW_BUNDLE_FILE="$HOME/Dotfiles/Brewfile"
export LANG="en_US.UTF-8"
export EDITOR="nvim"

# source "$HOME/Documents/Dotfiles/env-vars.sh"



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
# Other
#########################################################################################
# Add https://github.com/ajeetdsouza/zoxide
eval "$(zoxide init zsh)"

# Use mise
eval "$(mise activate zsh)"

# export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"
