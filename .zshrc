export ZSH="$HOME/.oh-my-zsh"
export PATH=/usr/local/bin:$PATH

ZSH_THEME="robbyrussell"
alias gs="git status"
alias gb="git branch --sort=-committerdate"
alias edf="nvim ~/code/dotfiles"
alias ex="exa --icons -laTL1"
alias dev="npm run dev"
alias cat="bat"
alias devinstall="npm ci && npm run dev"
alias c="open $1 -a \"Visual Studio Code\""
alias uproles="Mix.Tasks.Tiger.UpsertDefaultRoles.run()"
alias tdb="pg_ctl start && redis-server"
alias ts="mix deps.get && iex -S mix phx.server"
alias gfh="git log -p --"
alias gco="git checkout"
alias gre="git restore ."
alias vim="nvim"


export EDITOR='nvim'

plugins=( 
    # other plugins...
    # git
    zsh-z
    zsh-autosuggestions
    asdf
)

source $ZSH/oh-my-zsh.sh

# Example aliases
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
export PATH=/usr/local/bin:$PATH

export FZF_DEFAULT_COMMAND='fd --type f -HI'


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# eval "$(starship init zsh)"


# bun completions
[ -s "/Users/vp/.bun/_bun" ] && source "/Users/vp/.bun/_bun"

source <(remotectl completion zsh)
compdef _remotectl remotectl


# Bun
export BUN_INSTALL="/Users/vp/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
# export PATH="~/.emacs.d/bin"
export REMOTE_USERNAME=vaidotas@remote.com

export AWS_PROFILE=sts
