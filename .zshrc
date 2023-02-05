# ZSH config
ZSH_THEME="bureau"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
ZSH_DISABLE_COMPFIX="true"
export LANG=en_US.UTF-8
export ZSH="$HOME/.oh-my-zsh"
export ZSHRC="$HOME/.zshrc"
export DOCKER_BUILDKIT=1
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.cargo/bin:/usr/local/opt/openssl@1.1/bin:$HOME/.istioctl/bin"
autoload -Uz compinit
compinit

plugins=(git brew kubectl kube-ps1)
source $ZSH/oh-my-zsh.sh
export EDITOR='subl -w'
RPROMPT=$RPROMPT'$(kube_ps1)'


for file in ~/.{aliases,functions,path,dockerfunc,extra,exports}; do
	if [[ -r "$file" ]] && [[ -f "$file" ]]; then
		source "$file"
	fi
done
unset file


eval "$(pyenv init -)"
autoload -Uz compinit
compinit -i
# Node tooling
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
source <(npm completion)

# Setup autojump
[ -f $(brew --prefix)/etc/profile.d/autojump.sh ] && . $(brew --prefix)/etc/profile.d/autojump.sh

# GH autocompletion
eval "$(gh completion -s zsh)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ryanquinn/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/ryanquinn/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ryanquinn/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/ryanquinn/google-cloud-sdk/completion.zsh.inc'; fi
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.poetry/bin:$PATH"

alias ls="exa"

if [ -f './usr/local/opt/asdf/libexec/asdf.sh']; then . '/usr/local/opt/asdf/libexec/asdf.sh'; fi
