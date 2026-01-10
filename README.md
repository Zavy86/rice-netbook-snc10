# rice-netbook-snc10
Netbook Samsung NC10 Alpine Linux Sway




netbook setup

login as root withoud password

setup-alpine

keymap: it -> it-winkeys
hostname: snc10 o netbook
interfaces: wlan0, w_N, w_pwd, dhcp, done, n
set root password
timezone: Europe -> Rome
proxy: none
ntp: busybox
apk: c (community) -> f (find and use the fastest mirror) o 55 alpinelinux.mirror.garr.it
user: username -> Nome Cognome -> pwd -> none
ssh server: none
disk: sda -> sys -> y (erase all)
reboot (remove usb)


post-setup:

install doas
apk add doas
nano /etc/doas.conf
uncomment permit persist :wheel
addgroup username wheel

install editors
apk update
apk add nano micro

install terminus font
apk add terminus-font
nano /etc/conf.d/consolefont
modificare in ter-v16n.psf.gz
rc-update add consolefont boot
reboot

install acpi to check battery status
apk add acpi
usage: acpi -b o -i

enable clipboard
sudo apk add wl-clipboard

install sway
setup-devd udev
apk add dbus
rc-update add dbus
rc-service dbus start
setup-desktop sway

nano /home/username/.profile
```
# start sway on tty1
if [ "$(tty)" = "/dev/tty1" ]; then
     exec dbus-run-session sway 
fi
```
reboot


configurazione di sway
mkdir -p /home/username/.config/sway
cp /ect/sway/config /home/username/.config/sway
micro /home/username/.config/sway
search xkb_layout and add:
input type:keyboard {
  xkb_layout "it"
  xkb_variant "winkeys"
}


install brightness control
sudo apk add brightnessctl

installazione aichat gemini
wget https://github.com/sigoden/aichat/releases/download/v0.30.0/aichat-v0.30.0-i686-unknown-linux-musl.tar.gz
tar -xf aichat*.tar.gz
mv aichat /usr/local/bin
execute and configure token
add sway shortcut
micro /home/username/.config/sway
bindsym $mod+Shift+g exec foot aichat -s
(-s mantiene la sessione di default si chiamerà temp)

