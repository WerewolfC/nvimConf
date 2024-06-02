# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

export PATH=$PATH:/sdev/bin
export PATH=$PATH:/home/fcomanes/.local/bin
export PATH="`echo "$PATH" |/bin/awk 'BEGIN{RS=":";}{sub(sprintf("%c$",10),"");if(A[$0]){}else{A[$0]=1;printf(((NR==1)?"":":")$0)}}'`";

# User specific aliases and functions
test -f ~/.cpd_aliases && source ~/.cpd_aliases
test -f ~/.cpd_aliases && source ~/.cpd_aliases


WORKSPACE_ROOT=/workspace/fcomanes/repo_source
GIT_ROOT=/workspace/fcomanes/repo_source/

# user aliases
alias cdr='cd $WORKSPACE_ROOT/ && ls -ld */'
alias cdv='cd $GIT_ROOT && ~/Nvim/nvim-linux64/bin/nvim'
alias gk='git log --pretty="format:%C(auto)%h %Cgreen%al: %C(auto)%s ... %Cred on %ad" --graph --date=short'
alias fzf='~/apps/fzf/fzf'
alias bat='~/apps/bat/bat'
alias rg='~/apps/ripgrep/rg'
#fuzzy find/edit stuff
alias ff='fzf --preview '\''~/apps/bat/bat --style numbers,changes --color=always {}'\'' --preview-window=up:60%'
alias fe='nvim $(fzf --preview '\''~/apps/bat/bat --style numbers,changes --color=always {}'\'' --preview-window=up:60%)'

# querry and open specified git repo and launches ff
fff(){
    clear
    echo "Fuzzy file finder"
    cdr
    read -p "Select git repo to use: " repo_folder
    cd $repo_folder
    if [[ $? -eq 0 ]]; then
        ff
    else
    echo "Incorect folder!"
    fi
}

# querry and open specified git repo {1} and launches fe
ffe(){
    clear
    echo "Fuzzy file editor"
    cdr
    read -p "Select git repo to use: " repo_folder
    cd $repo_folder
    if [[ $? -eq 0 ]]; then
        fe
    else
    echo "Incorect folder!"
    fi
}

export PATH=$PATH:/home/$USER/apps/ripgrep

if type rg &> /dev/null; then
    export FZF_DEFAULT_COMMAND='rg --files --hidden --no-require-git'
fi

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
    --layout=reverse
    --color=bg+:#000000'

# export TERM=linux
test -f ~/.cpd_aliases && source ~/.cpd_aliases
