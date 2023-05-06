# -*- shell-script -*-
# shellcheck disable=SC2034
# shellcheck disable=SC2016
# shellcheck shell=bash
# shellcheck source=/dev/null
# shellcheck disable=SC2034
# If not running interactively, don't do anything
[ -z "$PS1" ] && return

export ITERM_ENABLE_SHELL_INTEGRATION_WITH_TMUX=YES

export TERM="xterm-color" 

ulimit -n 8192
# maxproc
# ulimit -u 1024

# shell history
shopt -s histappend
HISTSIZE=100000
HISTFILESIZE=100000
HISTTIMEFORMAT="%F %T "
PROMPT_COMMAND="history -a"

alias ls='exa -a --grid --color auto --sort=type'
alias ll='exa --long --color always --icons --sort=type'
alias la='exa --grid --all --color auto --icons --sort=type'
alias lla='exa --long --all --color auto --icons --sort=type'

alias pn=pnpm


export DOTNET_CLI_TELEMETRY_OPTOUT=1

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
HISTCONTROL=$HISTCONTROL${HISTCONTROL+:}ignoredups
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth

HISTIGNORE="reboot:shutdown *:ls:pwd:exit:mount:man *:history"
# Add timestamp to history file.
export HISTTIMEFORMAT="%F %T "
PROMPT_COMMAND='history -a'


# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:/Users/janitor/.cargo/bin:/Users/janitor/.nix-profile/bin:/nix/var/nix/profiles/default/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/go/bin:/usr/local/bin/"

export PATH="/Users/janitor/miniforge3/bin:/Users/janitor/miniforge3/condabin:/Users/janitor/.sdkman/candidates/java/current/bin:/Users/janitor/.rbenv/shims:/Users/janitor/.pyenv/shims:/opt/homebrew/opt/bison/bin:/opt/homebrew/opt/go@1.18/bin:/Users/janitor/.local/bin:/opt/local/bin:/opt/local/sbin:/Users/janitor/.nvm/versions/node/v16.17.1/bin:/usr/local/opt/coreutils/libexec/gnubin:/opt/homebrew/bin:/opt/homebrew/sbin:/Users/janitor/.cargo/bin:/Users/janitor/.nix-profile/bin:/nix/var/nix/profiles/default/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/go/bin"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac


export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

#######################################################
### colors ############################################
### modifications to PS1 prompt. order is important ###
#######################################################

# shell colouring
export TERM="xterm-color" 
export PS1='\[\e[0;33m\]\u\[\e[0m\]@\[\e[0;32m\]\h\[\e[0m\]:\[\e[0;34m\]\w\[\e[0m\]\$ '

# enable color support for ls
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

#######################################################
### git ###############################################
### provides what branch you are on + coloring ########
#######################################################
# {git}
# terminal apperance:
# 21:25:04 sbacha Sams-MacBook-Pro /Users/sbacha
#  ^Red      ^green   ^dark green    ^purple
#######################################################

git_branch () { git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'; }
HOST='\033[02;36m\]\h'; HOST=' '$HOST
TIME='\033[01;31m\]\t \033[01;32m\]'
LOCATION=' \033[01;34m\]`pwd | sed "s#\(/[^/]\{1,\}/[^/]\{1,\}/[^/]\{1,\}/\).*\(/[^/]\{1,\}/[^/]\{1,\}\)/\{0,1\}#\1_\2#g"`'
BRANCH=' \033[00;33m\]$(git_branch)\[\033[00m\]\n\$ '
PS1=$TIME$USER$HOST$LOCATION$BRANCH
PS2='\[\033[01;36m\]>'

ForegroundColour=#A0A0A0
BackgroundColour=#1B1D1E
CursorColour=#A0A0A0
Black=#1B1D1E
Red=#F92672
Green=#82B414
Yellow=#FD971F
Blue=#268BD2
Magenta=#8C54FE
Cyan=#56C2D6
White=#CCCCC6
BoldRed=#FF5995
BoldBlack=#505354
BoldGreen=#B7EB46
BoldYellow=#FEED6C
BoldBlue=#62ADE3
BoldMagenta=#BFA0FE
BoldCyan=#94D8E5

export FZF_EIP_HOME=$HOME/.fzf-eip
source "$FZF_EIP_HOME"/init.sh

# enable programmable completion features (you don't need to enable
# this if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"


#  mcd:     Makes new Dir and jumps inside
mcd () { mkdir -p "$1" && cd "$1" || exit; }
PATH="/usr/local/bin":"$PATH"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# opam configuration
test -r /Users/janitor/.opam/opam-init/init.sh && . /Users/janitor/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# pnpm
export PNPM_HOME="/Users/janitor/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

export PATH="$PATH:/Users/janitor/.foundry/bin"
PATH="$(brew --prefix)/opt/coreutils/libexec/gnubin:$PATH"
PATH="/opt/homebrew/opt/gnu-tar/libexec/gnubin:$PATH"


test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
source ~/.foundry/forge.d
source ~/.foundry/cast.d

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/janitor/miniforge3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/janitor/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/janitor/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/janitor/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export GPG_TTY=$(tty)

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
. "$HOME/.cargo/env"

  [[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"

##
# Your previous /Users/janitor/.bash_profile file was backed up as /Users/janitor/.bash_profile.macports-saved_2023-03-24_at_23:32:43
##

# MacPorts Installer addition on 2023-03-24_at_23:32:43: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

# pnpm
export PNPM_HOME="/Users/janitor/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
