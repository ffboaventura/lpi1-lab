---
template: index
title: Laboratório 09
sitename: LPIC-II - Laboratório 09
---

## Identificando serviços

### Avaliação Local

* [X] Identificar serviços em execução nos clientes

#### Ubuntu

```bash
root@clt-ubnt-01:~# systemctl list-unit-files | head -n 1 && systemctl list-unit-files | grep enabled | grep service | grep -v systemd
UNIT FILE                                  STATE           VENDOR PRESET
accounts-daemon.service                    enabled         enabled
acpid.service                              disabled        enabled
alsa-restore.service                       static          enabled
alsa-state.service                         static          enabled
alsa-utils.service                         masked          enabled
anacron.service                            enabled         enabled
apache-htcacheclean.service                disabled        enabled
apache-htcacheclean@.service               disabled        enabled
apache2.service                            enabled         enabled
apache2@.service                           disabled        enabled
apparmor.service                           enabled         enabled
apport-autoreport.service                  static          enabled
apport-forward@.service                    static          enabled
apport.service                             generated       enabled
apt-daily-upgrade.service                  static          enabled
apt-daily.service                          static          enabled
arpwatch.service                           enabled         enabled
arpwatch@.service                          disabled        enabled
atd.service                                enabled         enabled
autovt@.service                            enabled         enabled
avahi-daemon.service                       enabled         enabled
bind9.service                              enabled         enabled
blk-availability.service                   enabled         enabled
blueman-mechanism.service                  enabled         enabled
bluetooth.service                          enabled         enabled
bolt.service                               static          enabled
brltty-udev.service                        static          enabled
brltty.service                             disabled        enabled
clean-mount-point@.service                 static          enabled
cloud-config.service                       enabled         enabled
cloud-final.service                        enabled         enabled
cloud-init-local.service                   enabled         enabled
cloud-init.service                         enabled         enabled
colord.service                             static          enabled
configure-printer@.service                 static          enabled
console-setup.service                      enabled         enabled
container-getty@.service                   static          enabled
cron.service                               enabled         enabled
cryptdisks-early.service                   masked          enabled
cryptdisks.service                         masked          enabled
cups-browsed.service                       enabled         enabled
cups.service                               enabled         enabled
dbus-fi.w1.wpa_supplicant1.service         enabled         enabled
dbus-org.bluez.service                     enabled         enabled
dbus-org.freedesktop.Avahi.service         enabled         enabled
dbus-org.freedesktop.hostname1.service     static          enabled
dbus-org.freedesktop.locale1.service       static          enabled
dbus-org.freedesktop.login1.service        static          enabled
dbus-org.freedesktop.ModemManager1.service enabled         enabled
dbus-org.freedesktop.nm-dispatcher.service enabled         enabled
dbus-org.freedesktop.resolve1.service      enabled         enabled
dbus-org.freedesktop.thermald.service      enabled         enabled
dbus-org.freedesktop.timedate1.service     static          enabled
dbus-org.freedesktop.timesync1.service     enabled         enabled
dbus.service                               static          enabled
display-manager.service                    static          enabled
dm-event.service                           static          enabled
dmesg.service                              enabled         enabled
e2scrub@.service                           static          enabled
e2scrub_all.service                        static          enabled
e2scrub_fail@.service                      static          enabled
e2scrub_reap.service                       enabled         enabled
emergency.service                          static          enabled
finalrd.service                            enabled         enabled
fprintd.service                            static          enabled
friendly-recovery.service                  static          enabled
fstrim.service                             static          enabled
fwupd-offline-update.service               static          enabled
fwupd.service                              static          enabled
gdm.service                                static          enabled
gdm3.service                               static          enabled
geoclue.service                            static          enabled
getty-static.service                       static          enabled
getty@.service                             enabled         enabled
gpu-manager.service                        enabled         enabled
grub-common.service                        generated       enabled
grub-initrd-fallback.service               enabled         enabled
hddtemp.service                            generated       enabled
hwclock.service                            masked          enabled
iio-sensor-proxy.service                   static          enabled
initrd-cleanup.service                     static          enabled
initrd-parse-etc.service                   static          enabled
initrd-switch-root.service                 static          enabled
initrd-udevadm-cleanup-db.service          static          enabled
ippusbxd@.service                          static          enabled
irqbalance.service                         enabled         enabled
iscsi.service                              enabled         enabled
iscsid.service                             disabled        enabled
kerneloops.service                         enabled         enabled
keyboard-setup.service                     enabled         enabled
kmod-static-nodes.service                  static          enabled
kmod.service                               static          enabled
lightdm.service                            static          enabled
lm-sensors.service                         enabled         enabled
logrotate.service                          static          enabled
lvm2-lvmpolld.service                      static          enabled
lvm2-monitor.service                       enabled         enabled
lvm2-pvscan@.service                       static          enabled
lvm2.service                               masked          enabled
lxd-agent-9p.service                       enabled         enabled
lxd-agent.service                          enabled         enabled
man-db.service                             static          enabled
mdadm-grow-continue@.service               static          enabled
mdadm-last-resort@.service                 static          enabled
mdcheck_continue.service                   static          enabled
mdcheck_start.service                      static          enabled
mdmon@.service                             static          enabled
mdmonitor-oneshot.service                  static          enabled
mdmonitor.service                          static          enabled
ModemManager.service                       enabled         enabled
modprobe@.service                          static          enabled
motd-news.service                          static          enabled
multipath-tools-boot.service               masked          enabled
multipath-tools.service                    enabled         enabled
multipathd.service                         enabled         enabled
nagios4.service                            generated       enabled
named-resolvconf.service                   disabled        enabled
named.service                              enabled         enabled
netplan-ovs-cleanup.service                enabled-runtime enabled
network-manager.service                    enabled         enabled
networkd-dispatcher.service                enabled         enabled
NetworkManager-dispatcher.service          enabled         enabled
NetworkManager-wait-online.service         enabled         enabled
NetworkManager.service                     enabled         enabled
nmbd.service                               enabled         enabled
ondemand.service                           enabled         enabled
open-iscsi.service                         enabled         enabled
open-vm-tools.service                      enabled         enabled
packagekit-offline-update.service          static          enabled
packagekit.service                         static          enabled
phpsessionclean.service                    static          enabled
plymouth-halt.service                      static          enabled
plymouth-kexec.service                     static          enabled
plymouth-log.service                       static          enabled
plymouth-poweroff.service                  static          enabled
plymouth-quit-wait.service                 static          enabled
plymouth-quit.service                      static          enabled
plymouth-read-write.service                static          enabled
plymouth-reboot.service                    static          enabled
plymouth-start.service                     static          enabled
plymouth-switch-root.service               static          enabled
plymouth.service                           static          enabled
polkit.service                             static          enabled
pollinate.service                          enabled         enabled
portmap.service                            enabled         enabled
postfix.service                            enabled         enabled
postfix@.service                           indirect        enabled
pppd-dns.service                           enabled         enabled
procps.service                             static          enabled
pulseaudio-enable-autospawn.service        masked          enabled
quotaon.service                            static          enabled
rc-local.service                           static          enabled
rc.service                                 masked          enabled
rcS.service                                masked          enabled
rescue.service                             static          enabled
rpcbind.service                            enabled         enabled
rsync.service                              enabled         enabled
rsyslog.service                            enabled         enabled
rtkit-daemon.service                       disabled        enabled
samba-ad-dc.service                        masked          enabled
saned.service                              masked          enabled
saned@.service                             indirect        enabled
screen-cleanup.service                     masked          enabled
secureboot-db.service                      enabled         enabled
serial-getty@.service                      disabled        enabled
setvtrgb.service                           enabled         enabled
slapd.service                              generated       enabled
smbd.service                               enabled         enabled
snap.lxd.activate.service                  enabled         enabled
snap.lxd.daemon.service                    static          enabled
snapd.apparmor.service                     enabled         enabled
snapd.autoimport.service                   enabled         enabled
snapd.core-fixup.service                   enabled         enabled
snapd.failure.service                      static          enabled
snapd.recovery-chooser-trigger.service     enabled         enabled
snapd.seeded.service                       enabled         enabled
snapd.service                              enabled         enabled
snapd.snap-repair.service                  static          enabled
snapd.system-shutdown.service              enabled         enabled
speech-dispatcher.service                  disabled        enabled
speech-dispatcherd.service                 disabled        enabled
spice-vdagent.service                      indirect        enabled
spice-vdagentd.service                     indirect        enabled
ssh.service                                enabled         enabled
ssh@.service                               static          enabled
sshd.service                               enabled         enabled
sudo.service                               masked          enabled
switcheroo-control.service                 enabled         enabled
syslog.service                             enabled         enabled
sysstat.service                            enabled         enabled
system-update-cleanup.service              static          enabled
thermald.service                           enabled         enabled
ua-messaging.service                       static          enabled
ua-reboot-cmds.service                     enabled         enabled
udev.service                               static          enabled
udisks2.service                            enabled         enabled
ufw.service                                enabled         enabled
unattended-upgrades.service                enabled         enabled
upower.service                             disabled        enabled
usb_modeswitch@.service                    static          enabled
usbmuxd.service                            static          enabled
user-runtime-dir@.service                  static          enabled
user@.service                              static          enabled
uuidd.service                              indirect        enabled
vgauth.service                             enabled         enabled
virtualbox-guest-utils.service             enabled         enabled
vmtoolsd.service                           enabled         enabled
wacom-inputattach@.service                 static          enabled
whoopsie.service                           enabled         enabled
winbind.service                            enabled         enabled
wpa_supplicant-nl80211@.service            disabled        enabled
wpa_supplicant-wired@.service              disabled        enabled
wpa_supplicant.service                     enabled         enabled
wpa_supplicant@.service                    disabled        enabled
x11-common.service                         masked          enabled
xfs_scrub@.service                         static          enabled
xfs_scrub_all.service                      static          enabled
xfs_scrub_fail@.service                    static          enabled
```

#### CentOS

```bash
[root@clt-ctos-02 ~]# systemctl list-unit-files | head -n 1 && systemctl list-unit-files | grep enabled | grep service | grep -v systemd
UNIT FILE                                     STATE
abrt-ccpp.service                             enabled
abrt-oops.service                             enabled
abrt-vmcore.service                           enabled
abrt-xorg.service                             enabled
abrtd.service                                 enabled
accounts-daemon.service                       enabled
auditd.service                                enabled
autovt@.service                               enabled
bluetooth.service                             enabled
chronyd.service                               enabled
crond.service                                 enabled
dbus-org.bluez.service                        enabled
dbus-org.freedesktop.nm-dispatcher.service    enabled
display-manager.service                       enabled
dmraid-activation.service                     enabled
getty@.service                                enabled
httpd.service                                 enabled
initial-setup-reconfiguration.service         enabled
ipmi.service                                  enabled
ipmievd.service                               enabled
irqbalance.service                            enabled
iscsi-onboot.service                          enabled
iscsi.service                                 enabled
kdump.service                                 enabled
lightdm.service                               enabled
lm_sensors.service                            enabled
lvm2-monitor.service                          enabled
mdmonitor.service                             enabled
microcode.service                             enabled
multipathd.service                            enabled
NetworkManager-dispatcher.service             enabled
NetworkManager-wait-online.service            enabled
NetworkManager.service                        enabled
postfix.service                               enabled
qemu-guest-agent.service                      enabled
rhel-autorelabel-mark.service                 enabled
rhel-autorelabel.service                      enabled
rhel-configure.service                        enabled
rhel-dmesg.service                            enabled
rhel-domainname.service                       enabled
rhel-import-state.service                     enabled
rhel-loadmodules.service                      enabled
rhel-readonly.service                         enabled
rsyslog.service                               enabled
rtkit-daemon.service                          enabled
sshd.service                                  enabled
sysstat.service                               enabled
tuned.service                                 enabled
udisks2.service                               enabled
vboxadd-service.service                       enabled
vboxadd.service                               enabled
winbind.service                               enabled
```

* [X] Identificar serviços em execução nos roteadores


#### Ubuntu

```bash
root@rtr-ubnt-02:~# systemctl list-unit-files | head -n 1 && systemctl list-unit-files | grep enabled | grep service | grep -v systemd
UNIT FILE                                  STATE           VENDOR PRESET
accounts-daemon.service                    enabled         enabled
acpid.service                              disabled        enabled
alsa-restore.service                       static          enabled
alsa-state.service                         static          enabled
alsa-utils.service                         masked          enabled
anacron.service                            enabled         enabled
apache-htcacheclean.service                disabled        enabled
apache-htcacheclean@.service               disabled        enabled
apache2.service                            disabled        enabled
apache2@.service                           disabled        enabled
apparmor.service                           enabled         enabled
apport-autoreport.service                  static          enabled
apport-forward@.service                    static          enabled
apport.service                             generated       enabled
apt-daily-upgrade.service                  static          enabled
apt-daily.service                          static          enabled
arpwatch.service                           enabled         enabled
arpwatch@.service                          indirect        enabled
atd.service                                enabled         enabled
autovt@.service                            enabled         enabled
avahi-daemon.service                       enabled         enabled
bind9.service                              enabled         enabled
blk-availability.service                   enabled         enabled
blueman-mechanism.service                  enabled         enabled
bluetooth.service                          enabled         enabled
bolt.service                               static          enabled
brltty-udev.service                        static          enabled
brltty.service                             disabled        enabled
clean-mount-point@.service                 static          enabled
cloud-config.service                       enabled         enabled
cloud-final.service                        enabled         enabled
cloud-init-local.service                   enabled         enabled
cloud-init.service                         enabled         enabled
colord.service                             static          enabled
configure-printer@.service                 static          enabled
console-setup.service                      enabled         enabled
container-getty@.service                   static          enabled
cron.service                               enabled         enabled
cryptdisks-early.service                   masked          enabled
cryptdisks.service                         masked          enabled
cups-browsed.service                       enabled         enabled
cups.service                               enabled         enabled
dbus-fi.w1.wpa_supplicant1.service         enabled         enabled
dbus-org.bluez.service                     enabled         enabled
dbus-org.freedesktop.Avahi.service         enabled         enabled
dbus-org.freedesktop.hostname1.service     static          enabled
dbus-org.freedesktop.locale1.service       static          enabled
dbus-org.freedesktop.login1.service        static          enabled
dbus-org.freedesktop.ModemManager1.service enabled         enabled
dbus-org.freedesktop.nm-dispatcher.service enabled         enabled
dbus-org.freedesktop.resolve1.service      enabled         enabled
dbus-org.freedesktop.thermald.service      enabled         enabled
dbus-org.freedesktop.timedate1.service     static          enabled
dbus-org.freedesktop.timesync1.service     enabled         enabled
dbus.service                               static          enabled
display-manager.service                    static          enabled
dm-event.service                           static          enabled
dmesg.service                              enabled         enabled
e2scrub@.service                           static          enabled
e2scrub_all.service                        static          enabled
e2scrub_fail@.service                      static          enabled
e2scrub_reap.service                       enabled         enabled
emergency.service                          static          enabled
finalrd.service                            enabled         enabled
fprintd.service                            static          enabled
friendly-recovery.service                  static          enabled
fstrim.service                             static          enabled
fwupd-offline-update.service               static          enabled
fwupd.service                              static          enabled
gdm.service                                static          enabled
gdm3.service                               static          enabled
geoclue.service                            static          enabled
getty-static.service                       static          enabled
getty@.service                             enabled         enabled
gpu-manager.service                        enabled         enabled
grub-common.service                        generated       enabled
grub-initrd-fallback.service               enabled         enabled
hddtemp.service                            generated       enabled
hwclock.service                            masked          enabled
iio-sensor-proxy.service                   static          enabled
initrd-cleanup.service                     static          enabled
initrd-parse-etc.service                   static          enabled
initrd-switch-root.service                 static          enabled
initrd-udevadm-cleanup-db.service          static          enabled
ippusbxd@.service                          static          enabled
irqbalance.service                         enabled         enabled
iscsi.service                              enabled         enabled
iscsid.service                             disabled        enabled
kerneloops.service                         enabled         enabled
keyboard-setup.service                     enabled         enabled
kmod-static-nodes.service                  static          enabled
kmod.service                               static          enabled
lightdm.service                            static          enabled
lm-sensors.service                         enabled         enabled
logrotate.service                          static          enabled
lvm2-lvmpolld.service                      static          enabled
lvm2-monitor.service                       enabled         enabled
lvm2-pvscan@.service                       static          enabled
lvm2.service                               masked          enabled
lxd-agent-9p.service                       enabled         enabled
lxd-agent.service                          enabled         enabled
man-db.service                             static          enabled
mdadm-grow-continue@.service               static          enabled
mdadm-last-resort@.service                 static          enabled
mdcheck_continue.service                   static          enabled
mdcheck_start.service                      static          enabled
mdmon@.service                             static          enabled
mdmonitor-oneshot.service                  static          enabled
mdmonitor.service                          static          enabled
ModemManager.service                       enabled         enabled
modprobe@.service                          static          enabled
motd-news.service                          static          enabled
multipath-tools-boot.service               masked          enabled
multipath-tools.service                    enabled         enabled
multipathd.service                         enabled         enabled
nagios4.service                            generated       enabled
named-resolvconf.service                   disabled        enabled
named.service                              enabled         enabled
netplan-ovs-cleanup.service                enabled-runtime enabled
network-manager.service                    enabled         enabled
networkd-dispatcher.service                enabled         enabled
NetworkManager-dispatcher.service          enabled         enabled
NetworkManager-wait-online.service         enabled         enabled
NetworkManager.service                     enabled         enabled
nginx.service                              enabled         enabled
nmbd.service                               enabled         enabled
ondemand.service                           enabled         enabled
open-iscsi.service                         enabled         enabled
open-vm-tools.service                      enabled         enabled
packagekit-offline-update.service          static          enabled
packagekit.service                         static          enabled
pcscd.service                              indirect        enabled
phpsessionclean.service                    static          enabled
plymouth-halt.service                      static          enabled
plymouth-kexec.service                     static          enabled
plymouth-log.service                       static          enabled
plymouth-poweroff.service                  static          enabled
plymouth-quit-wait.service                 static          enabled
plymouth-quit.service                      static          enabled
plymouth-read-write.service                static          enabled
plymouth-reboot.service                    static          enabled
plymouth-start.service                     static          enabled
plymouth-switch-root.service               static          enabled
plymouth.service                           static          enabled
polkit.service                             static          enabled
pollinate.service                          enabled         enabled
portmap.service                            enabled         enabled
postfix.service                            enabled         enabled
postfix@.service                           indirect        enabled
pppd-dns.service                           enabled         enabled
procps.service                             static          enabled
pulseaudio-enable-autospawn.service        masked          enabled
quotaon.service                            static          enabled
rc-local.service                           static          enabled
rc.service                                 masked          enabled
rcS.service                                masked          enabled
rescue.service                             static          enabled
rpcbind.service                            enabled         enabled
rsync.service                              enabled         enabled
rsyslog.service                            enabled         enabled
rtkit-daemon.service                       disabled        enabled
samba-ad-dc.service                        masked          enabled
saned.service                              masked          enabled
saned@.service                             indirect        enabled
screen-cleanup.service                     masked          enabled
secureboot-db.service                      enabled         enabled
serial-getty@.service                      disabled        enabled
setvtrgb.service                           enabled         enabled
slapd.service                              generated       enabled
smbd.service                               enabled         enabled
snap.lxd.activate.service                  enabled         enabled
snap.lxd.daemon.service                    static          enabled
snapd.apparmor.service                     enabled         enabled
snapd.autoimport.service                   enabled         enabled
snapd.core-fixup.service                   enabled         enabled
snapd.failure.service                      static          enabled
snapd.recovery-chooser-trigger.service     enabled         enabled
snapd.seeded.service                       enabled         enabled
snapd.service                              enabled         enabled
snapd.snap-repair.service                  static          enabled
snapd.system-shutdown.service              enabled         enabled
speech-dispatcher.service                  disabled        enabled
speech-dispatcherd.service                 disabled        enabled
spice-vdagent.service                      indirect        enabled
spice-vdagentd.service                     indirect        enabled
ssh.service                                enabled         enabled
ssh@.service                               static          enabled
sshd.service                               enabled         enabled
sudo.service                               masked          enabled
switcheroo-control.service                 enabled         enabled
syslog.service                             enabled         enabled
sysstat.service                            enabled         enabled
system-update-cleanup.service              static          enabled
tgt.service                                enabled         enabled
thermald.service                           enabled         enabled
ua-messaging.service                       static          enabled
ua-reboot-cmds.service                     enabled         enabled
udev.service                               static          enabled
udisks2.service                            enabled         enabled
ufw.service                                enabled         enabled
unattended-upgrades.service                enabled         enabled
upower.service                             disabled        enabled
usb_modeswitch@.service                    static          enabled
usbmuxd.service                            static          enabled
user-runtime-dir@.service                  static          enabled
user@.service                              static          enabled
uuidd.service                              indirect        enabled
vgauth.service                             enabled         enabled
virtualbox-guest-utils.service             enabled         enabled
vmtoolsd.service                           enabled         enabled
wacom-inputattach@.service                 static          enabled
whoopsie.service                           enabled         enabled
winbind.service                            enabled         enabled
wpa_supplicant-nl80211@.service            disabled        enabled
wpa_supplicant-wired@.service              disabled        enabled
wpa_supplicant.service                     enabled         enabled
wpa_supplicant@.service                    disabled        enabled
x11-common.service                         masked          enabled
xfs_scrub@.service                         static          enabled
xfs_scrub_all.service                      static          enabled
xfs_scrub_fail@.service                    static          enabled
```

#### CentOS

```bash
[root@rtr-ctos-01 ~]# systemctl list-unit-files | head -n 1 && systemctl list-unit-files | grep enabled | grep service | grep -v systemd
UNIT FILE                                     STATE
abrt-ccpp.service                             enabled
abrt-oops.service                             enabled
abrt-vmcore.service                           enabled
abrt-xorg.service                             enabled
abrtd.service                                 enabled
accounts-daemon.service                       enabled
auditd.service                                enabled
autovt@.service                               enabled
bluetooth.service                             enabled
chronyd.service                               enabled
crond.service                                 enabled
dbus-org.bluez.service                        enabled
dbus-org.freedesktop.nm-dispatcher.service    enabled
display-manager.service                       enabled
dmraid-activation.service                     enabled
getty@.service                                enabled
initial-setup-reconfiguration.service         enabled
ipmi.service                                  enabled
ipmievd.service                               enabled
irqbalance.service                            enabled
iscsi-onboot.service                          enabled
iscsi.service                                 enabled
kdump.service                                 enabled
lightdm.service                               enabled
lm_sensors.service                            enabled
lvm2-monitor.service                          enabled
mdmonitor.service                             enabled
microcode.service                             enabled
multipathd.service                            enabled
named.service                                 enabled
NetworkManager-dispatcher.service             enabled
NetworkManager-wait-online.service            enabled
NetworkManager.service                        enabled
nginx.service                                 enabled
postfix.service                               enabled
qemu-guest-agent.service                      enabled
rhel-autorelabel-mark.service                 enabled
rhel-autorelabel.service                      enabled
rhel-configure.service                        enabled
rhel-dmesg.service                            enabled
rhel-domainname.service                       enabled
rhel-import-state.service                     enabled
rhel-loadmodules.service                      enabled
rhel-readonly.service                         enabled
rsyslog.service                               enabled
rtkit-daemon.service                          enabled
slapd.service                                 enabled
sshd.service                                  enabled
sysstat.service                               enabled
tuned.service                                 enabled
udisks2.service                               enabled
vboxadd-service.service                       enabled
vboxadd.service                               enabled
```

* [X] Identificar portas abertas nos clientes

#### Ubuntu

```bash
root@clt-ubnt-01:~# ss -ntlup
Netid         State          Recv-Q         Send-Q                             Local Address:Port  Peer Address:PortProcess
udp           UNCONN         0              0                                        0.0.0.0:111        0.0.0.0:*    users:(("rpcbind",pid=632,fd=5),("systemd",pid=1,fd=36)) udp           UNCONN         0              0                                        0.0.0.0:631        0.0.0.0:*    users:(("cups-browsed",pid=797,fd=7))
udp           UNCONN         0              0                                     172.18.2.3:137        0.0.0.0:*    users:(("nmbd",pid=878,fd=17))
udp           UNCONN         0              0                                     172.18.2.2:137        0.0.0.0:*    users:(("nmbd",pid=878,fd=16))
udp           UNCONN         0              0                                        0.0.0.0:137        0.0.0.0:*    users:(("nmbd",pid=878,fd=14))
udp           UNCONN         0              0                                     172.18.2.3:138        0.0.0.0:*    users:(("nmbd",pid=878,fd=19))
udp           UNCONN         0              0                                     172.18.2.2:138        0.0.0.0:*    users:(("nmbd",pid=878,fd=18))
udp           UNCONN         0              0                                        0.0.0.0:138        0.0.0.0:*    users:(("nmbd",pid=878,fd=15))
udp           UNCONN         0              0                                        0.0.0.0:56543      0.0.0.0:*    users:(("avahi-daemon",pid=725,fd=14))
udp           UNCONN         0              0                                        0.0.0.0:5353       0.0.0.0:*    users:(("avahi-daemon",pid=725,fd=12))
udp           UNCONN         0              0                                     172.18.2.2:53         0.0.0.0:*    users:(("named",pid=802,fd=19))
udp           UNCONN         0              0                                      127.0.0.1:53         0.0.0.0:*    users:(("named",pid=802,fd=15))
udp           UNCONN         0              0                                  127.0.0.53%lo:53         0.0.0.0:*    users:(("systemd-resolve",pid=690,fd=12))
udp           UNCONN         0              0                                           [::]:111           [::]:*    users:(("rpcbind",pid=632,fd=7),("systemd",pid=1,fd=38))
udp           UNCONN         0              0                                           [::]:5353          [::]:*    users:(("avahi-daemon",pid=725,fd=13))
udp           UNCONN         0              0                                           [::]:37685         [::]:*    users:(("avahi-daemon",pid=725,fd=15))
udp           UNCONN         0              0                                          [::1]:53            [::]:*    users:(("named",pid=802,fd=23))
udp           UNCONN         0              0              [fe80::a00:27ff:fe4b:ff23]%enp0s8:53            [::]:*    users:(("named",pid=802,fd=26))
tcp           LISTEN         0              1024                                     0.0.0.0:389        0.0.0.0:*    users:(("slapd",pid=961,fd=8))
tcp           LISTEN         0              50                                       0.0.0.0:139        0.0.0.0:*    users:(("smbd",pid=1065,fd=35))
tcp           LISTEN         0              4096                                     0.0.0.0:111        0.0.0.0:*    users:(("rpcbind",pid=632,fd=4),("systemd",pid=1,fd=35))
tcp           LISTEN         0              10                                    172.18.2.2:53         0.0.0.0:*    users:(("named",pid=802,fd=22),("named",pid=802,fd=21))
tcp           LISTEN         0              10                                     127.0.0.1:53         0.0.0.0:*    users:(("named",pid=802,fd=18),("named",pid=802,fd=17))
tcp           LISTEN         0              4096                               127.0.0.53%lo:53         0.0.0.0:*    users:(("systemd-resolve",pid=690,fd=13))
tcp           LISTEN         0              128                                      0.0.0.0:22         0.0.0.0:*    users:(("sshd",pid=943,fd=3))
tcp           LISTEN         0              5                                      127.0.0.1:631        0.0.0.0:*    users:(("cupsd",pid=727,fd=7))
tcp           LISTEN         0              100                                      0.0.0.0:25         0.0.0.0:*    users:(("master",pid=1249,fd=13))
tcp           LISTEN         0              4096                                   127.0.0.1:953        0.0.0.0:*    users:(("named",pid=802,fd=29))
tcp           LISTEN         0              50                                       0.0.0.0:445        0.0.0.0:*    users:(("smbd",pid=1065,fd=34))
tcp           LISTEN         0              1024                                        [::]:389           [::]:*    users:(("slapd",pid=961,fd=9))
tcp           LISTEN         0              50                                          [::]:139           [::]:*    users:(("smbd",pid=1065,fd=33))
tcp           LISTEN         0              4096                                        [::]:111           [::]:*    users:(("rpcbind",pid=632,fd=6),("systemd",pid=1,fd=37))
tcp           LISTEN         0              511                                            *:80               *:*    users:(("apache2",pid=1054,fd=4),("apache2",pid=1043,fd=4),("apache2",pid=1042,fd=4),("apache2",pid=1041,fd=4),("apache2",pid=1034,fd=4),("apache2",pid=1015,fd=4))
tcp           LISTEN         0              10             [fe80::a00:27ff:fe4b:ff23]%enp0s8:53            [::]:*    users:(("named",pid=802,fd=28),("named",pid=802,fd=27))
tcp           LISTEN         0              10                                         [::1]:53            [::]:*    users:(("named",pid=802,fd=25),("named",pid=802,fd=24))
tcp           LISTEN         0              128                                         [::]:22            [::]:*    users:(("sshd",pid=943,fd=4))
tcp           LISTEN         0              5                                          [::1]:631           [::]:*    users:(("cupsd",pid=727,fd=6))
tcp           LISTEN         0              4096                                       [::1]:953           [::]:*    users:(("named",pid=802,fd=30))
tcp           LISTEN         0              511                                            *:443              *:*    users:(("apache2",pid=1054,fd=6),("apache2",pid=1043,fd=6),("apache2",pid=1042,fd=6),("apache2",pid=1041,fd=6),("apache2",pid=1034,fd=6),("apache2",pid=1015,fd=6))
tcp           LISTEN         0              50                                          [::]:445           [::]:*    users:(("smbd",pid=1065,fd=32))
```

#### CentOS

```bash
[root@clt-ctos-02 ~]# ss -ntlup
Netid  State      Recv-Q Send-Q Local Address:Port               Peer Address:Port
udp    UNCONN     0      0      127.0.0.1:323                 *:*                   users:(("chronyd",pid=705,fd=5))
udp    UNCONN     0      0       [::1]:323                  [::]:*                   users:(("chronyd",pid=705,fd=6))
tcp    LISTEN     0      128     *:22                  *:*                   users:(("sshd",pid=1013,fd=3))
tcp    LISTEN     0      100     *:25                  *:*                   users:(("master",pid=1252,fd=13))
tcp    LISTEN     0      128      [::]:80                   [::]:*                   users:(("httpd",pid=1390,fd=4),("httpd",pid=1389,fd=4),("httpd",pid=1388,fd=4),("httpd",pid=1387,fd=4),("httpd",pid=1386,fd=4),("httpd",pid=1376,fd=4))
tcp    LISTEN     0      128      [::]:22                   [::]:*                   users:(("sshd",pid=1013,fd=4))
tcp    LISTEN     0      128      [::]:443                  [::]:*                   users:(("httpd",pid=1390,fd=6),("httpd",pid=1389,fd=6),("httpd",pid=1388,fd=6),("httpd",pid=1387,fd=6),("httpd",pid=1386,fd=6),("httpd",pid=1376,fd=6))

```

* [X] Identificar portas abertas nos roteadores

#### Ubuntu

```bash
root@rtr-ubnt-02:~# ss -ntlup
Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name
tcp        0      0 0.0.0.0:3260            0.0.0.0:*               LISTEN      810/tgtd
tcp        0      0 0.0.0.0:445             0.0.0.0:*               LISTEN      1029/smbd
tcp        0      0 0.0.0.0:389             0.0.0.0:*               LISTEN      968/slapd
tcp        0      0 0.0.0.0:139             0.0.0.0:*               LISTEN      1029/smbd
tcp        0      0 0.0.0.0:111             0.0.0.0:*               LISTEN      1/init
tcp        0      0 0.0.0.0:80              0.0.0.0:*               LISTEN      1080/nginx: master
tcp        0      0 10.9.8.2:53             0.0.0.0:*               LISTEN      806/named
tcp        0      0 172.17.15.1:53          0.0.0.0:*               LISTEN      806/named
tcp        0      0 192.168.18.199:53       0.0.0.0:*               LISTEN      806/named
tcp        0      0 127.0.0.1:53            0.0.0.0:*               LISTEN      806/named
tcp        0      0 127.0.0.53:53           0.0.0.0:*               LISTEN      717/systemd-resolve
tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN      960/sshd: /usr/sbin
tcp        0      0 127.0.0.1:631           0.0.0.0:*               LISTEN      735/cupsd
tcp        0      0 127.0.0.1:953           0.0.0.0:*               LISTEN      806/named
tcp6       0      0 :::3260                 :::*                    LISTEN      810/tgtd
tcp6       0      0 :::445                  :::*                    LISTEN      1029/smbd
tcp6       0      0 :::389                  :::*                    LISTEN      968/slapd
tcp6       0      0 :::139                  :::*                    LISTEN      1029/smbd
tcp6       0      0 :::111                  :::*                    LISTEN      1/init
tcp6       0      0 :::80                   :::*                    LISTEN      1080/nginx: master
tcp6       0      0 fe80::a00:27ff:fe92::53 :::*                    LISTEN      806/named
tcp6       0      0 fe80::a00:27ff:fe12::53 :::*                    LISTEN      806/named
tcp6       0      0 fe80::a00:27ff:fefa::53 :::*                    LISTEN      806/named
tcp6       0      0 2804:7f2:59f:451d:a0:53 :::*                    LISTEN      806/named
tcp6       0      0 ::1:53                  :::*                    LISTEN      806/named
tcp6       0      0 :::22                   :::*                    LISTEN      960/sshd: /usr/sbin
tcp6       0      0 ::1:631                 :::*                    LISTEN      735/cupsd
tcp6       0      0 ::1:953                 :::*                    LISTEN      806/named
udp        0      0 10.9.8.3:137            0.0.0.0:*                           900/nmbd
udp        0      0 10.9.8.2:137            0.0.0.0:*                           900/nmbd
udp        0      0 172.17.15.3:137         0.0.0.0:*                           900/nmbd
udp        0      0 172.17.15.1:137         0.0.0.0:*                           900/nmbd
udp        0      0 192.168.18.255:137      0.0.0.0:*                           900/nmbd
udp        0      0 192.168.18.199:137      0.0.0.0:*                           900/nmbd
udp        0      0 0.0.0.0:137             0.0.0.0:*                           900/nmbd
udp        0      0 10.9.8.3:138            0.0.0.0:*                           900/nmbd
udp        0      0 10.9.8.2:138            0.0.0.0:*                           900/nmbd
udp        0      0 172.17.15.3:138         0.0.0.0:*                           900/nmbd
udp        0      0 172.17.15.1:138         0.0.0.0:*                           900/nmbd
udp        0      0 192.168.18.255:138      0.0.0.0:*                           900/nmbd
udp        0      0 192.168.18.199:138      0.0.0.0:*                           900/nmbd
udp        0      0 0.0.0.0:138             0.0.0.0:*                           900/nmbd
udp        0      0 0.0.0.0:42134           0.0.0.0:*                           733/avahi-daemon: r
udp        0      0 0.0.0.0:5353            0.0.0.0:*                           733/avahi-daemon: r
udp        0      0 10.9.8.2:53             0.0.0.0:*                           806/named
udp        0      0 172.17.15.1:53          0.0.0.0:*                           806/named
udp        0      0 192.168.18.199:53       0.0.0.0:*                           806/named
udp        0      0 127.0.0.1:53            0.0.0.0:*                           806/named
udp        0      0 127.0.0.53:53           0.0.0.0:*                           717/systemd-resolve
udp        0      0 0.0.0.0:111             0.0.0.0:*                           1/init
udp        0      0 0.0.0.0:631             0.0.0.0:*                           798/cups-browsed
udp6       0      0 :::41422                :::*                                733/avahi-daemon: r
udp6       0      0 :::5353                 :::*                                733/avahi-daemon: r
udp6       0      0 fe80::a00:27ff:fefa:546 :::*                                715/systemd-network
udp6       0      0 ::1:53                  :::*                                806/named
udp6       0      0 2804:7f2:59f:451d:a0:53 :::*                                806/named
udp6       0      0 fe80::a00:27ff:fefa::53 :::*                                806/named
udp6       0      0 fe80::a00:27ff:fe12::53 :::*                                806/named
udp6       0      0 fe80::a00:27ff:fe92::53 :::*                                806/named
udp6       0      0 :::111                  :::*                                1/init
```

#### CentOS

```bash
[root@rtr-ctos-01 ~]# ss -ntlup
Netid  State      Recv-Q Send-Q Local Address:Port               Peer Address:Port
udp    UNCONN     0      0      10.9.8.1:53                  *:*                   users:(("named",pid=1101,fd=515))
udp    UNCONN     0      0      172.18.2.1:53                  *:*                   users:(("named",pid=1101,fd=514))
udp    UNCONN     0      0      192.168.18.202:53                  *:*                   users:(("named",pid=1101,fd=513))
udp    UNCONN     0      0      127.0.0.1:53                  *:*                   users:(("named",pid=1101,fd=512))
udp    UNCONN     0      0      127.0.0.1:323                 *:*                   users:(("chronyd",pid=679,fd=5))
udp    UNCONN     0      0       [::1]:323                  [::]:*                   users:(("chronyd",pid=679,fd=6))
tcp    LISTEN     0      100    127.0.0.1:25                  *:*                   users:(("master",pid=1336,fd=13))
tcp    LISTEN     0      128    127.0.0.1:953                 *:*                   users:(("named",pid=1101,fd=25))
tcp    LISTEN     0      128     *:389                 *:*                   users:(("slapd",pid=1260,fd=8))
tcp    LISTEN     0      128     *:80                  *:*                   users:(("nginx",pid=1498,fd=6),("nginx",pid=1496,fd=6))
tcp    LISTEN     0      10     10.9.8.1:53                  *:*                   users:(("named",pid=1101,fd=24))
tcp    LISTEN     0      10     172.18.2.1:53                  *:*                   users:(("named",pid=1101,fd=23))
tcp    LISTEN     0      10     192.168.18.202:53                  *:*                   users:(("named",pid=1101,fd=22))
tcp    LISTEN     0      10     127.0.0.1:53                  *:*                   users:(("named",pid=1101,fd=21))
tcp    LISTEN     0      128     *:22                  *:*                   users:(("sshd",pid=1061,fd=3))
tcp    LISTEN     0      100     [::1]:25                   [::]:*                   users:(("master",pid=1336,fd=14))
tcp    LISTEN     0      128     [::1]:953                  [::]:*                   users:(("named",pid=1101,fd=26))
tcp    LISTEN     0      128      [::]:389                  [::]:*                   users:(("slapd",pid=1260,fd=9))
tcp    LISTEN     0      128      [::]:80                   [::]:*                   users:(("nginx",pid=1498,fd=7),("nginx",pid=1496,fd=7))
tcp    LISTEN     0      128      [::]:22                   [::]:*                   users:(("sshd",pid=1061,fd=4))
```

### Avaliação Remota (a partir de um cliente)

* [X] Identificar portas abertas nos servidores da outra rede

#### Azul

```bash
[root@clt-ctos-02 ~]# nmap -sS -sU -T4 -A -O -v 172.18.2.1 172.18.2.1

```

#### Vermelho

```bash
root@clt-ubnt-01:~# nmap -sS -sU -T4 -A -O -v 172.17.15.1 172.17.15.1

```

## Respostas

[Respostas](respostas01.md)
