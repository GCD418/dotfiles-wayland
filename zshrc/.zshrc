# zmodload zsh/zprof

# Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Powerlevel10k
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Aliases
alias grep='grep --color=auto'
alias ls='ls --color=auto'

# Faster compinit (use cache)
autoload -Uz compinit
compinit -C

# Lazy-load conda (much faster startup)
_conda_lazy() {
  source /opt/miniconda3/etc/profile.d/conda.sh
  conda "$@"
}
alias conda=_conda_lazy

# zsh-syntax-highlighting must be last
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zprof
