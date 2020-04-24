alias :q=exit
alias python=python3

# tmux pane setup
alias py-tmux="bash ~/scripts/py-tmux.sh"

# run gnome control center in i3
alias gnome-control-center-i3="env XDG_CURRENT_DESKTOP=GNOME gnome-control-center"

# ranger: stay at directory when you quit
alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'

# copy current working directory path to clipboard:
alias copypath='pwd | xclip -selection clipboard'
