# *******************************************************************************
# Author: Vivek Jha
# Last Modified: Mar 21, 2024
# 
# ================================================================================
# I - Instant Prompt
# ================================================================================
p10k_inst_prompt="$XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh"
[[ ! -r $p10k_inst_prompt ]] || source $p10k_inst_prompt
# ================================================================================
# II - PATH
# ================================================================================
source "$XDG_CONFIG_HOME/homebrew/.brew"
[[ "$PATH" == */Library/TeX/texbin* ]] || export PATH=$PATH:/Library/TeX/texbin
# ================================================================================
# III - History
# ================================================================================
HISTFILE="$XDG_CACHE_HOME/zsh/.zsh_history"
HISTSIZE=12000
SAVEHIST=10000
# ================================================================================
# IV - Options
# ================================================================================
setopt always_to_end
setopt append_history
setopt auto_cd
setopt auto_menu
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt inc_append_history
setopt menu_complete
setopt share_history
# ================================================================================
# V - Functions
# ================================================================================
fpath=(
    "$ZDOTDIR/zsh-plugins/zsh-completions/src"
    "$ZDOTDIR/zsh-autoload"
    "$ZDOTDIR/zsh-functions"
    "${fpath[@]}"
)
autoload -Uz compinit; compinit
autoload -Uz colors && colors
autoload -Uz downloadRepos
autoload -Uz condainit
autoload -Uz plug
autoload -Uz take
# ================================================================================
# VI - Plugins
# ================================================================================
plug z.lua
plug zsh-autocomplete
plug zsh-autosuggestions
plug zsh-colored-man-pages
plug zsh-sudo
plug zsh-vscode
plug zsh-you-should-use
plug zsh-history-substring-search
plug zsh-syntax-highlighting
# ================================================================================
# VII - Aliases
# ================================================================================
source "$ZDOTDIR/.zshaliases"
# ================================================================================
# VIII - Themes
# ================================================================================
# 1. Prompt
# --------------------------------------------------------------------------------
export ZSH_THEME=powerlevel10k
source "$HOMEBREW_PREFIX/share/$ZSH_THEME/powerlevel10k.zsh-theme"
source "$ZDOTDIR/zsh-themes/$ZSH_THEME/.p10k.zsh"
# --------------------------------------------------------------------------------
# 2. Autocomplete
# --------------------------------------------------------------------------------
# TODO Configure Autocompletions
# --------------------------------------------------------------------------------
# 2. Autosuggestions
# --------------------------------------------------------------------------------
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"
# --------------------------------------------------------------------------------
# 3. Dircolors
# --------------------------------------------------------------------------------
export DIRCOLORS_THEME=sourdiesel
source "$XDG_CONFIG_HOME/dircolors/config"
# --------------------------------------------------------------------------------
# 4. Grep
# --------------------------------------------------------------------------------
export GREP_COLOR=5
# --------------------------------------------------------------------------------
# 5. You Should Use
# --------------------------------------------------------------------------------
export YSU_MESSAGE_FORMAT="${YELLOW}[ysu reminder]${NONE}: \
${BLUE}%alias_type ${PINK}%alias${WHITE}=${GREEN}'%command'${NONE}"
# --------------------------------------------------------------------------------
# 6. Syntax Highlighting
# --------------------------------------------------------------------------------
export ZSH_SYNTAX_THEME=sourdiesel
source "$ZDOTDIR/zsh-plugins/zsh-syntax-highlighting/themes/$ZSH_SYNTAX_THEME.zsh"
# ================================================================================
# XI - Keybindings
# ================================================================================
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
# bindkey '^A' beginning-of-line
# bindkey '^E' end-of-line
# ================================================================================
# XII - Completions
# ================================================================================
source "$ZDOTDIR/zsh-completions.zsh"
# ================================================================================
# XIII - Python
# ================================================================================
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/pythonstartup.py"
# ================================================================================
# XIV - Vim
# ================================================================================
export VIMINIT=":set runtimepath^=~/.config/vim/.vim|:source ~/.config/vim/.vimrc"
# ================================================================================
# XV - Databases
# ================================================================================
export MYSQL_HISTFILE=~/.cache/mysql/.mysql_history
export MYCLI_HISTFILE=~/.cache/mycli/.mycli-history
# ================================================================================
# XVI - Fuzzy Finder
# ================================================================================
source "$XDG_CONFIG_HOME/fzf/.fzf"
