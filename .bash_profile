#
# ~/.bash_profile
#

#[[ -f ~/.bashrc ]] && . ~/.bashrc

# include .bashrc if it exists
if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi


export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/home/jake/.local/bin:$PATH"
export PATH="/home/jake/.emacs.d/bin:$PATH"
export PATH="/home/jake/scripts:$PATH"
