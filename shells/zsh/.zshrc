# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="alanpeabody"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.

COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git pyenv python sublime brew brew-cask git-remote-branch colorize)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"

# Boxen env

[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

#PIP/Python virtualenv

export PIP_REQUIRE_VIRTUALENV=true
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache
syspip(){
   PIP_REQUIRE_VIRTUALENV="" pip "$@"
}

# ssh
export SSH_KEY_PATH="~/.ssh/id_rsa"

# Aliases for log servers:
alias pod1a='ssh -t -L 5011:logs03.ord.zdsys.com:22  bevans@admin05.ord.zdsys.com ssh -t bevans@logs03.ord.zdsys.com screen -D -R bevans'
alias pod1b='ssh -t -L 5012:logs04.ord.zdsys.com:22  bevans@admin06.ord.zdsys.com ssh -t bevans@logs04.ord.zdsys.com screen -D -R bevans'
alias pod2a='ssh -t -L 5021:logs1.sac1.zdsys.com:22  bevans@admin1.sac1.zdsys.com ssh -t bevans@logs1.sac1.zdsys.com screen -D -R bevans'
alias pod2b='ssh -t -L 5022:logs2.sac1.zdsys.com:22  bevans@admin1.sac1.zdsys.com ssh -t bevans@logs2.sac1.zdsys.com screen -D -R bevans'
alias pod3a='ssh -t -L 5031:logs1.dub1.zdsys.com:22  bevans@admin1.dub1.zdsys.com ssh -t bevans@logs1.dub1.zdsys.com screen -D -R bevans'
alias pod3b='ssh -t -L 5032:logs2.dub1.zdsys.com:22  bevans@admin1.dub1.zdsys.com ssh -t bevans@logs2.dub1.zdsys.com screen -D -R bevans'
alias pod4a='ssh -t -L 5041:logs1.pod4.sac1.zdsys.com:22  bevans@admin1.sac1.zdsys.com ssh -t bevans@logs1.pod4.sac1.zdsys.com screen -D -R bevans'
alias pod4b='ssh -t -L 5042:logs2.pod4.sac1.zdsys.com:22  bevans@admin1.sac1.zdsys.com ssh -t bevans@logs2.pod4.sac1.zdsys.com screen -D -R bevans'

alias sac1='ssh -t bevans@admin1.sac1.zdsys.com screen -D -R bevans'
alias ord='ssh -t bevans@admin05.ord.zdsys.com screen -D -R bevans'
alias dub1='ssh -t bevans@admin1.dub1.zdsys.com screen -D -R bevans'

#Aliases for scp proxy
alias scp_pod1a='scp -P 5012'
alias scp_pod1b='scp -P 5012'
alias scp_pod2a='scp -P 5021'
alias scp_pod2b='scp -P 5022'
alias scp_pod3a='scp -P 5031'
alias scp_pod3b='scp -P 5032'
alias scp_pod4a='scp -P 5041'
alias scp_pod4b='scp -P 5042'

#command aliases 
alias update-all='boxen && /opt/boxen/repo/script/update-all ~/Projects/boxen/zendesk/'
