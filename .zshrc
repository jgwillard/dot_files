eval "$(/opt/homebrew/bin/brew shellenv)"

# ask before deleting
alias rm="rm -i"

# use neovim by default (`vim` still opens vim)
alias vi="nvim"

# use lazyvim as default nvim config
export NVIM_APPNAME=lazyvim

# use python3 by default
alias python="python3"
alias pip="pip3"

# enable screen clearing
LESS='-g -i -M -R -S -w -z-4'
