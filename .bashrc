# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
  if groups `whoami` | grep -q people; then
      . /usr/local/etc/usersrc/common
  fi
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


# Github
export LD_LIBRARY_PATH=
source ~/bin/git.bash


#source /usr/local/sw/urtools/bigprompt
# Function to run the pull script when entering a directory
function chpwd() {
    if [ -d .git ]; then
        ~/bin/pull_latest.sh
    fi
}

# Ensure the function runs when changing directories
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND ;}chpwd"



# User specific aliases and functions
PATH=$PATH:/scratch/myang_shared/software/Admixtools/bin/

# Paths for YangLab directory
alias cdm='cd /scratch/myang_shared'
alias cdmd='cd /scratch/myang_shared/data'
alias cdjp='cd /scratch/myang_shared/lab/Skyler'
alias back="cd -"
alias bh="ssh skyler@billieholiday"
alias spdr="ssh installer@spydur"
alias up="cd .."
