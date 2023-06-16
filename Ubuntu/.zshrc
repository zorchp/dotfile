### ZSH HOME
export ZSH=$HOME/.zsh

### ---- history config ----------
export HISTFILE=$ZSH/.zsh_history

# How many commands zsh will load to memory.
export HISTSIZE=10000

# How maney commands history will save on file.
export SAVEHIST=10000

# History won't save duplicates.
setopt HIST_IGNORE_ALL_DUPS

# History won't show duplicates on search.
setopt HIST_FIND_NO_DUPS


NEWLINE=$'\n'
PROMPT=" [Ubuntu] %(?.%F{green}√.%F{red}?%?)%f  %B%F{69}%~ ${NEWLINE} %F{35}==>%f%b "
#RPROMPT="%F{50}[%*]"

# brew
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

source $ZSH/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
fpath=($ZSH/plugins/zsh-completions/src $fpath)

# zsh-autosuggestions:config
source $ZSH/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=cyan,bold,underline"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

# end config
# -----自动补全

# some more ls aliases
alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi


alias vi=nvim
alias cl=clear
alias vz='vi ~/.zshrc'
alias sz='source ~/.zshrc'
func_tcp() { firewall-cmd --zone=public --add-port=$1/tcp --permanent && iptables -I INPUT -ptcp --dport $1 -j ACCEPT; }
alias addtcp='func_tcp'
alias addudp='func_udp() { firewall-cmd --zone=public --add-port=$1/udp --permanent && iptables -I INPUT -pudp --dport $1 -j ACCEPT; };func_udp'
alias reufw='firewall-cmd --reload'
alias port_status='func_port_status() { sudo netstat -tunlp | grep $1 && sudo iptables -L -n --line-numbers | grep $1; }; func_port_status'
alias gcl='git clone'

alias vpn='pm2 start /home/zorch/clash1/clash'
alias uvpn='pm2 stop /home/zorch/clash1/clash'

alias vv="export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890"
alias uv="unset https_proxy http_proxy all_proxy"

alias goo='curl -vvv google.com'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/zorch/miniforge3/bin/conda' 'shell.bash' 'hook' 2>/dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/zorch/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/home/zorch/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/home/zorch/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

alias py3xi="conda activate py3xi"
alias depy="conda deactivate"
alias ipy="ipython"

# #THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
# export SDKMAN_DIR="$HOME/.sdkman"
# [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.ustc.edu.cn/homebrew-core.git"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles"
export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.ustc.edu.cn/brew.git"

export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh" ] && \. "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh"                                       # This loads nvm
[ -s "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion
alias vc='cd ~/.config/nvim/lua/'

# set proxy
# export http_proxy="http://127.0.0.1:7892"
# export https_proxy="http://127.0.0.1:7892"
export PATH="/home/linuxbrew/.linuxbrew/lib/ruby/gems/3.1.0/bin:$PATH"

# Created by `pipx` on 2022-12-10 10:59:20
export PATH="$PATH:/home/zorch/.local/bin"

alias sql="mysql -uroot -p0000"
export PATH="/usr/local/openresty/bin:$PATH"
alias sys="cd ~/code/c_cpp_code/syscall"

ulimit -c unlimited
export HOMEBREW_EDITOR=nvim