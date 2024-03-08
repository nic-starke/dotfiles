# Source
source ~/.export
source ~/.bat

# History
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Clone zcomet if necessary
if [[ ! -f ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh ]]; then
  git clone https://github.com/agkozak/zcomet.git ${ZDOTDIR:-${HOME}}/.zcomet/bin
fi

# Source zcomet.zsh
source ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh

# Starship Promp
eval "$(starship init zsh)"

# Plugins
zcomet load zpm-zsh/colorize
zcomet load Freed-Wu/zsh-colorize-functions
zcomet load ohmyzsh plugins/gitfast
zcomet load zsh-users/zsh-syntax-highlighting
zcomet load zsh-users/zsh-autosuggestions

# Alias
alias ls='exa'                                                         # ls
alias l='exa -lbF --git'                                               # list, size, type, git
alias ll='exa -lbGF --git'                                             # long list
alias llm='exa -lbGd --git --sort=modified'                            # long list, modified date sort
alias la='exa -lbhHigUmuSa --time-style=long-iso --git --color-scale'  # all list
alias lx='exa -lbhHigUmuSa@ --time-style=long-iso --git --color-scale' # all + extended list
alias lS='exa -1'                                                      # one column, just names
alias lt='exa --tree --level=2'                                        # tree

# Keybindings
bindkey -e
# ctrl + left/right move words
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey '^[[3;5~' delete-word                 # Ctrl + del
bindkey '^H' backward-kill-word                 # Ctrl + backspace
bindkey "^[[3~" delete-char                     # Delete
bindkey "^[[5~" beginning-of-buffer-or-history  # Page Up
bindkey "^[[6~" end-of-buffer-or-history        # Page Down
bindkey "^[[H" beginning-of-line                # Home
bindkey "^[[F" end-of-line                      # End

# WORDCHARS
WORDCHARS=${WORDCHARS//[\/_.-]/}

# Run compinit and compile its cache
zcomet compinit
