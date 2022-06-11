# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export TERM="xterm-256color"

export PATH=$/.local/bin:$PATH
export XDG_CONFIG_HOME="$HOME/.config"

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
###  export PATH=$/.local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Path to nvim
export MYVIMRC="$XDG_CONFIG_HOME/nvim/init.vim"

# EDITOR
  export EDITOR="/usr/bin/vim" 

# Elixir
# iex history
  export ERL_AFLAGS="-kernel shell_history enabled"

# FD - FZF
  # Setting fd as the default source for fzf  
  #export FZF_DEFAULT_COMMAND='fd --type f'
  # To apply the command to CTRL-T as well
  
  #export FZF_BASE="/usr/bin/fzf"

  export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git -E '*.jpg' -E '*.exe' -E '*.vim' -E '*.rb' -E '*.ttf' -E '*.docx' -E '*.xz' -E '*.gz' -E '*.log' -E '*.zsh' -E '*.ch' -E '*.crate' -E '*.mak' -E '*.spec' -E '*.vader' -E '*.snip' -E '*.tiff' -E '*.s' -E '*.pl' -E '*.beam' -E '*.cpp' -E '*.py' -E '*.c' -E '*.h' -E '*.hpp' -E '*.png' -E '*.so' -E '*.dll' -E '*.zip' -E '*.svn' -E 'doc' -E 'usr' -E 'bin' -E 'tmp' -E 'node_modules' -E 'deps'"
  export FZF_DEFAULT_OPTS='
    --height 75% --multi --reverse
    --bind ctrl-f:page-down,ctrl-b:page-up
  '
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_CTRL_T_OPTS="--preview 'bat --color=always --line-range :500 {}'"
  export FZF_ALT_C_COMMAND='fd --type d . --color=never'
  export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -100'"

  export FORGE_CLIENT_ID="uSm0dhmIMVnaJziTqcI9IQYvAGpClnTW"
  export FORGE_CLIENT_SECRET="1VzAYIHf3qMv5Lmx"

  alias fct="fd --type f --hidden --follow --exclude .git -E '*.jpg' -E '*.exe' -E '*.vim' -E '*.rb' -E '*.ttf' -E '*.docx' -E '*.xz' -E '*.gz' -E '*.log' -E '*.zsh' -E '*.ch' -E '*.crate' -E '*.mak' -E '*.spec' -E '*.vader' -E '*.snip' -E '*.tiff' -E '*.s' -E '*.pl' -E '*.beam' -E '*.cpp' -E '*.py' -E '*.c' -E '*.h' -E '*.hpp' -E '*.png' -E '*.so' -E '*.dll' -E '*.zip' -E '*.svn' -E 'doc' -E 'usr' -E 'bin' -E 'tmp' -E 'node_modules' -E 'deps' | fzf --preview 'bat --color=always --line-range :500 {}'"
  alias fac="fd --type d . --color=never | fzf --preview 'tree -C {} | head -100'"

fzf_find_vim() {
    local file=$(
      fzf --query="$1" --no-multi --select-1 --exit-0 \
          --preview 'bat --color=always --line-range :500 {}'
      )
    if [[ -n $file ]]; then
        $EDITOR "$file"
    fi
}

fzf_find_emacs() {
    local file=$(
      fzf --query="$1" --no-multi --select-1 --exit-0 \
          --preview 'bat --color=always --line-range :500 {}'
      )
    if [[ -n $file ]]; then
        $EMACS "$file"
    fi
}
fzf_grep_vim(){
    if [[ $# == 0 ]]; then
        echo 'Error: search term was not provided.'
        return
    fi
    local match=$(
      rg --color=never --line-number "$1" |
        fzf --no-multi --delimiter : \
            --preview "bat --color=always --line-range {2}: {1}"
      )
    local file=$(echo "$match" | cut -d':' -f1)
    if [[ -n $file ]]; then
        $EDITOR "$file" +$(echo "$match" | cut -d':' -f2)
    fi
}
fzf_grep_emacs(){
    if [[ $# == 0 ]]; then
        echo 'Error: search term was not provided.'
        return
    fi
    local match=$(
      rg --color=never --line-number "$1" |
        fzf --no-multi --delimiter : \
            --preview "bat --color=always --line-range {2}: {1}"
      )
    local file=$(echo "$match" | cut -d':' -f1)
    if [[ -n $file ]]; then
        $EMACS "$file" +$(echo "$match" | cut -d':' -f2)
    fi
}
alias ffv='fzf_find_vim'
alias ffe='fzf_find_emacs'
alias fgv='fzf_grep_vim'
alias fge='fzf_grep_emacs'

#export PATH=$PATH:/home/suro/Tools/bin
#neofetch

ZSH_CURRENT_USER=$(whoami)

if [ "$ZSH_CURRENT_USER" = "root" ]; then
    export ZSH=/$ZSH_CURRENT_USER/.oh-my-zsh
else
    export ZSH=/home/$ZSH_CURRENT_USER/.oh-my-zsh
fi

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

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
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  fzf
  #history-substring-search
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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

# Midori from wiki.archlinux
export MOZ_PLUGIN_PATH="/usr/lib/mozilla/plugins"

#Autocomplete
autoload -Uz compinit
typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
if [ $(date +'%j') != $updated_at ]; then
  compinit -i
else
  compinit -C -i
fi
#Load complits module
zmodload -i zsh/complist

#Setting history
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZE
setopt hist_ignore_all_dups # remove older duplicate entries from history
setopt hist_reduce_blanks # remove superfluous blanks from history items
setopt inc_append_history # save history entries as soon as they are entered
setopt share_history # share history between different instances of the shell

#Correct commands
setopt interactive_comments # allow comments in interactive shells
setopt correct_all # autocorrect commands

#Tabs
setopt auto_cd # cd by typing directory name if it's not a command
setopt auto_list # automatically list choices on ambiguous completion
setopt auto_menu # automatically use menu completion
setopt always_to_end # move cursor to end if word had one match

#Parametrs of commands.
zstyle ':completion:*' menu select # select completions with arrow keys
zstyle ':completion:*' group-name '' # group results by category
zstyle ':completion:::::' completer _expand _complete _ignored _approximate # enable approximate matches for completion

#Load antibody plugin manager
source <(antibody init)
#Syntax
antibody bundle zdharma/fast-syntax-highlighting
#Autocomplite
antibody bundle zsh-users/zsh-autosuggestions
antibody bundle changyuheng/fz
#History complite
antibody bundle zsh-users/zsh-history-substring-search
antibody bundle zsh-users/zsh-completions
antibody bundle marzocchi/zsh-notify

#Elixir
antibody bundle gusaiani/elixir-oh-my-zsh

#SSH
antibody bundle gko/ssh-connect

#Keybindings
#History
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
#
bindkey '^[[3~' delete-char
bindkey '^[3;5~' delete-char

alias gtnel="find | grep"
alias voronel="find -ls | grep"
alias srs="watch sensors"

alias patmel='history | grep'

alias fm='ranger'
alias qni='systemctl suspend'
alias d='dirs -v | head -10'
alias vim='nvim'
alias cat='bat'
alias ld="ls -d */"

#tmux
alias tks="tmux kill-session -t"
alias tls="tmux ls"
alias kpnel="tmux attach -t"
alias nor="tmux new-session -s"

#edit config files
alias i3e='nvim ~/.config/i3/config'
alias zshe='nvim ~/.zshrc'
alias polybare='nvim ~/.config/polybar/config'

#IP
alias identme='curl http://ipinfo.io/ip && ip -c a | ag inet'

# Sequelize
alias sdc="sequelize db:create"
alias sdd="sequelize db:drop"
alias sdm="sequelize db:migrate"
alias sdmu="sequelize db:migrate:undo"
alias sdmua="sequelize db:migrate:undo:all"

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
