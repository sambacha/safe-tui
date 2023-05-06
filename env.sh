# NOTE this is sourced by X too, via .xsessionrc
# common static env here
export HOME=~
export GOPATH=$HOME/gocode
export PATH=$HOME/.local/bin:$HOME/bin:/usr/local/bin:/snap/bin:/var/lib/snapd/snap:/usr/local/sbin:/usr/local/share/npm/bin:$GOPATH/bin:/usr/local/go/bin:/usr/local/opt/coreutils/libexec/gnubin:/opt/homebrew/bin:$PATH
export EDITOR=vim-wrapper
export PAGER="less -R"
export MANPAGER="vim -M +MANPAGER --not-a-term -"
export LANG=en_GB.UTF-8
export BC_ENV_ARGS="$HOME/.bcrc -l"
export GCC_COLORS=1
export FZF_DEFAULT_COMMAND="rg --smart-case --files --hidden --ignore-file=$HOME/.rgignore"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Sometimes not set or fully qualified; simple name preferred.
export HOSTNAME=$(hostname -s)

eval "$($HOME/.local/bin/system-colour $HOSTNAME)"

# gpg-agent needs to know which tty to use
export GPG_TTY=$(tty)

eval "$($HOME/.local/bin/system-colour $HOSTNAME)"

if [[ $USER == root ]]; then
    PROMPT_COLOUR_FG=160 # red
    PROMPT_COLOUR_GB=16  # black
else
    PROMPT_COLOUR_FG=SYSTEM_COLOUR_FG
    PROMPT_COLOUR_GB=SYSTEM_COLOUR_BG
fi

HISTSIZE=5000

# Change default as unconfigured bash could clobber history. Bash can run
# unconfigured if CTRL+C is hit during initialisation.
HISTFILE=~/.history

if [ -f ~/.env-local.sh ]; then
    source ~/.env-local.sh
fi
