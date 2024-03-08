# Bat is a replacement for cat

# Alias
alias cat="bat"

# Integrate with manpage
#export MANPAGER="zsh -c 'col -bx | bat -l man -p'"

# Functions
batdiff() {
    git diff --name-only --relative --diff-filter=d | xargs bat --diff
}