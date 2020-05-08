# load zgen
source "${HOME}/.zgen/zgen.zsh"

# if the init scipt doesn't exist
if ! zgen saved; then

  zgen load unixorn/autoupdate-zgen
  zgen prezto
  zgen prezto git
  zgen prezto command-not-found
  zgen prezto tmux
  zgen load Seinh/git-prune
  zgen load djui/alias-tips
  zgen load supercrabtree/k
  zgen load zsh-users/zsh-completions
  zgen load zsh-users/zsh-syntax-highlighting
  zgen load zsh-users/zsh-autosuggestions
  zgen prezto history-substring-search
  zgen load supercrabtree/k
  zgen save
fi

export LC_ALL=en_US.UTF-8

# Set terminal color
export TERM=screen-256color

# prompt cloud ❦ yellow
prompt pure

# Allow typing comments in interactive mode
setopt interactivecomments

# Setup VIM as default editor
export EDITOR="nvim"
export USE_EDITOR=$EDITOR
export VISUAL=$EDITOR

KEYTIMEOUT=1

# Setup tmux autostart
zstyle ':prezto:module:tmux:auto-start' local 'yes'
zstyle ':prezto:module:tmux:auto-start' remote 'yes'

# Load custom configuration
if test -s ~/.zsh_custom; then
  source ~/.zsh_custom
fi

export PATH="/usr/local/bin:$PATH"
export NVM_DIR="$HOME/.nvm"
# . "/usr/local/opt/nvm/nvm.sh"

# export PATH="$HOME/.yarn/bin:$PATH"

export NPM_TOKEN=''
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
# nvm use default

autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"
  echo $nvmrc_path

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(head -1 "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# alias mux="tmuxinator"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Google Cloud SDK autosuggestions
# source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
# source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'

# alias python='/usr/bin/python3'
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

source /usr/local/share/autojump/autojump.zsh
