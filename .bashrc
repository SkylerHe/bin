[ -z "$PS1" ] && return
# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

export MODULEPATH=/usr/local/ur/modulefiles

source ~/bin/git.bash
#source ~/wstools.bash
export hpclib=/usr/local/hpclib
export PYTHONPATH="$hpclib"


# Function to run the pull script when entering a directory
function chpwd() {
    if [ -d .git ]; then
        ~/bin/pull_latest.sh
    fi
}

# Ensure the function runs when changing directories
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND ;}chpwd"


eval "$(/usr/local/anaconda3/bin/conda shell.bash hook)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/etc/profile.d/conda.sh" ]; then
        . "/usr/etc/profile.d/conda.sh"
    else
        export PATH="/usr/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
alias vi=/usr/bin/vim
alias spdr="ssh installer@spydur"
alias back="cd -"
umask 002
