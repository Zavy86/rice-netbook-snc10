# load shell settings
export ENV="$HOME/.shrc"

# enable ssh agent and add my key
if [ -z "$SSH_AUTH_SOCK" ]; then
    eval $(ssh-agent -s)
    ssh-add /home/zavy/.ssh/netbook.key
fi

# start sway on tty1
if [ "$(tty)" = "/dev/tty1" ]; then
  exec dbus-run-session sway
fi
