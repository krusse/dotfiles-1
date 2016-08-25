# Return if requirements are not found.
if (( ! $+commands[foreman] )); then
  return 1
fi

#
# Aliases
#
alias rors='foreman start -f Procfile.dev'
alias rorc='foreman run rails console'
alias rordb='foreman run rails dbconsole'
alias rorl='tail -f log/development.log'
