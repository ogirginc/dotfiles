###############################################################################
# Oh My Zsh configuration
###############################################################################
# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh



###############################################################################
# User configuration
###############################################################################

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"



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
alias .dotfiles="cd $HOME/Dotfiles && nvim"
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

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init.zsh 2>/dev/null || :
