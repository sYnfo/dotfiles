# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load
ZSH_THEME="blinks"

# Enable Z
source /usr/local/etc/profile.d/z.sh

# Enable oh-ny-zsh
source $ZSH/oh-my-zsh.sh

# Enable Rust stuff
source ~/.cargo/env
export PATH=/$HOME/.cargo/bin:$PATH

# Aliases
alias vim=nvim
alias irc=irssi
alias todo="vim ~/my/data/todo"
alias diary="vim ~/my/data/diary"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git, dirhistory)

export PATH=/usr/local/sbin:$HOME/bin:/usr/local/bin:/$HOME/.local/bin:$PATH

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Update PATH for the Google Cloud SDK.
source '/Users/matt/Downloads/google-cloud-sdk/path.zsh.inc'

# Enable shell command completion for gcloud.
source '/Users/matt/Downloads/google-cloud-sdk/completion.zsh.inc'
