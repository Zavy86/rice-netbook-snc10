# start sway on tty1
if [ "$(tty)" = "/dev/tty1" ]; then
  exec dbus-run-session sway
fi

# aliases
alias la="ls -a"
alias ll="ls -al"
