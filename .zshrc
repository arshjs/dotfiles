# ----- Aliases -----
alias ls='eza --icons -a --color=always'
alias ll='eza --icons -alhr --sort=modified --git --color=always'
alias cat='bat'


# ----- Miniconda Setup -----
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# ----- Starship setup -----
eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml


# ----- Zoxide setup -----
eval "$(zoxide init zsh)"
export _ZO_FZF_OPTS="--no-sort --keep-right --height=50% --info=inline --layout=reverse --exit-0 --select-1 --bind=ctrl-z:ignore --preview='\command eza --icons -ax -w 80 --no-quotes --sort=name --color=always {2..}' --preview-window=right"


# ----- fzf setup -----
function ff () {
    fzf \
    --style full \
    --walker-skip .git,node_modules,target \
    --preview 'bat --color=always --style=numbers {}' \
    --bind 'result:transform-list-label: 
        if [[ -z $FZF_QUERY ]]; then 
            echo " $FZF_MATCH_COUNT items " 
        else 
            echo " $FZF_MATCH_COUNT matches for [$FZF_QUERY] " 
        fi' \
    --bind 'focus:transform-preview-label:[[ -n {} ]] && printf " Previewing [%s] " {}' \
    --bind 'focus:+transform-header:file --brief {} || echo "No file selected"'
    }

export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--multi"
