alias :q=exit
alias python=python3

# ranger: stay at directory when you quit
alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'

# copy current working directory path to clipboard:
alias copypath='pwd | xclip -selection clipboard'


activate_venv () {
  venv_fname=${1:-.venv}
  if test -f "$venv_fname/bin/activate"; then
    source "$venv_fname/bin/activate"
  else
    echo "$venv_fname/bin/activate not found. Is it a virtualenv?"
    return 0
  fi
}
