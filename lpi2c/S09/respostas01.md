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
Starting Nmap 7.80 ( https://nmap.org ) at 2021-08-05 19:50 -03
NSE: Loaded 151 scripts for scanning.
NSE: Script Pre-scanning.
Initiating NSE at 19:50
Completed NSE at 19:50, 0.00s elapsed
Initiating NSE at 19:50
Completed NSE at 19:50, 0.00s elapsed
Initiating NSE at 19:50
Completed NSE at 19:50, 0.00s elapsed
Initiating Ping Scan at 19:50
Scanning 172.17.15.1 [4 ports]
Completed Ping Scan at 19:50, 0.01s elapsed (1 total hosts)
Initiating Parallel DNS resolution of 1 host. at 19:50
Completed Parallel DNS resolution of 1 host. at 19:50, 0.00s elapsed
Initiating Ping Scan at 19:50
Scanning 172.17.15.1 [4 ports]
Completed Ping Scan at 19:50, 0.00s elapsed (1 total hosts)
Initiating Parallel DNS resolution of 1 host. at 19:50
Completed Parallel DNS resolution of 1 host. at 19:50, 0.00s elapsed
Initiating SYN Stealth Scan at 19:50
Scanning 172.17.15.1 [1000 ports]
Discovered open port 53/tcp on 172.17.15.1
Discovered open port 139/tcp on 172.17.15.1
Discovered open port 445/tcp on 172.17.15.1
Discovered open port 80/tcp on 172.17.15.1
Discovered open port 111/tcp on 172.17.15.1
Discovered open port 22/tcp on 172.17.15.1
Discovered open port 389/tcp on 172.17.15.1
Discovered open port 3260/tcp on 172.17.15.1
Completed SYN Stealth Scan at 19:50, 0.07s elapsed (1000 total ports)
Initiating UDP Scan at 19:50
Scanning 172.17.15.1 [1000 ports]
Increasing send delay for 172.17.15.1 from 0 to 50 due to 11 out of 17 dropped probes since last increase.
Increasing send delay for 172.17.15.1 from 50 to 100 due to max_successful_tryno increase to 5
Increasing send delay for 172.17.15.1 from 100 to 200 due to max_successful_tryno increase to 6
Warning: 172.17.15.1 giving up on port because retransmission cap hit (6).
Increasing send delay for 172.17.15.1 from 200 to 400 due to 11 out of 15 dropped probes since last increase.
UDP Scan Timing: About 6.87% done; ETC: 19:58 (0:07:00 remaining)
Increasing send delay for 172.17.15.1 from 400 to 800 due to 11 out of 11 dropped probes since last increase.
UDP Scan Timing: About 10.01% done; ETC: 20:00 (0:09:08 remaining)
UDP Scan Timing: About 12.99% done; ETC: 20:02 (0:10:10 remaining)
Discovered open port 137/udp on 172.17.15.1
UDP Scan Timing: About 33.51% done; ETC: 20:05 (0:09:33 remaining)
UDP Scan Timing: About 40.26% done; ETC: 20:05 (0:08:47 remaining)
Stats: 0:06:05 elapsed; 0 hosts completed (1 up), 1 undergoing UDP Scan
UDP Scan Timing: About 40.66% done; ETC: 20:05 (0:08:53 remaining)
Discovered open port 53/udp on 172.17.15.1
UDP Scan Timing: About 46.03% done; ETC: 20:05 (0:08:04 remaining)
UDP Scan Timing: About 51.54% done; ETC: 20:05 (0:07:19 remaining)
Stats: 0:08:36 elapsed; 0 hosts completed (1 up), 1 undergoing UDP Scan
UDP Scan Timing: About 56.53% done; ETC: 20:06 (0:06:36 remaining)
Discovered open port 111/udp on 172.17.15.1
UDP Scan Timing: About 62.07% done; ETC: 20:06 (0:05:48 remaining)
UDP Scan Timing: About 67.29% done; ETC: 20:06 (0:05:01 remaining)
UDP Scan Timing: About 72.50% done; ETC: 20:06 (0:04:15 remaining)
UDP Scan Timing: About 77.51% done; ETC: 20:06 (0:03:29 remaining)
UDP Scan Timing: About 82.63% done; ETC: 20:06 (0:02:42 remaining)
UDP Scan Timing: About 87.74% done; ETC: 20:06 (0:01:55 remaining)
UDP Scan Timing: About 92.74% done; ETC: 20:06 (0:01:08 remaining)
Completed UDP Scan at 20:07, 978.84s elapsed (1000 total ports)
Initiating Service scan at 20:07
Scanning 30 services on 172.17.15.1
Service scan Timing: About 40.00% done; ETC: 20:09 (0:01:30 remaining)
Completed Service scan at 20:08, 97.64s elapsed (30 services on 1 host)
Initiating OS detection (try #1) against 172.17.15.1
Retrying OS detection (try #2) against 172.17.15.1
Retrying OS detection (try #3) against 172.17.15.1
Retrying OS detection (try #4) against 172.17.15.1
Retrying OS detection (try #5) against 172.17.15.1
Initiating Traceroute at 20:08
Completed Traceroute at 20:08, 0.01s elapsed
Initiating Parallel DNS resolution of 2 hosts. at 20:08
Completed Parallel DNS resolution of 2 hosts. at 20:08, 0.00s elapsed
NSE: Script scanning 172.17.15.1.
Initiating NSE at 20:08
Completed NSE at 20:09, 57.84s elapsed
Initiating NSE at 20:09
Completed NSE at 20:09, 1.06s elapsed
Initiating NSE at 20:09
Completed NSE at 20:09, 0.01s elapsed
Nmap scan report for 172.17.15.1
Host is up (0.0015s latency).
Not shown: 1970 closed ports
PORT      STATE         SERVICE       VERSION
22/tcp    open          ssh           OpenSSH 8.2p1 Ubuntu 4ubuntu0.2 (Ubuntu Linux; protocol 2.0)
53/tcp    open          domain        ISC BIND 9.16.1 (Ubuntu Linux)
80/tcp    open          http          nginx 1.18.0 (Ubuntu)
| http-methods:
|_  Supported Methods: GET HEAD
|_http-server-header: nginx/1.18.0 (Ubuntu)
|_http-title: Apache2 Ubuntu Default Page: It works
111/tcp   open          rpcbind       2-4 (RPC #100000)
| rpcinfo:
|   program version    port/proto  service
|   100000  2,3,4        111/tcp   rpcbind
|   100000  2,3,4        111/udp   rpcbind
|   100000  3,4          111/tcp6  rpcbind
|_  100000  3,4          111/udp6  rpcbind
139/tcp   open          netbios-ssn   Samba smbd 4.6.2
389/tcp   open          ldap          OpenLDAP 2.2.X - 2.3.X
445/tcp   open          netbios-ssn   Samba smbd 4.6.2
3260/tcp  open          tcpwrapped
53/udp    open          domain        ISC BIND 9.16.1 (Ubuntu Linux)
| dns-nsid:
|_  bind.version: 9.16.1-Ubuntu
111/udp   open          rpcbind       2-4 (RPC #100000)
| rpcinfo:
|   program version    port/proto  service
|   100000  2,3,4        111/tcp   rpcbind
|   100000  2,3,4        111/udp   rpcbind
|   100000  3,4          111/tcp6  rpcbind
|_  100000  3,4          111/udp6  rpcbind
137/udp   open          netbios-ns    Samba nmbd netbios-ns (workgroup: THEFORCE)
138/udp   open|filtered netbios-dgm
443/udp   open|filtered https
515/udp   open|filtered printer
626/udp   open|filtered serialnumberd
631/udp   open|filtered ipp
1044/udp  open|filtered dcutility
1484/udp  open|filtered confluent
1718/udp  open|filtered h225gatedisc
3659/udp  open|filtered apple-sasl
5353/udp  open|filtered zeroconf
16862/udp open|filtered unknown
17331/udp open|filtered unknown
19625/udp open|filtered unknown
23965/udp open|filtered unknown
27899/udp open|filtered unknown
36108/udp open|filtered unknown
51586/udp open|filtered unknown
53589/udp open|filtered unknown
60172/udp open|filtered unknown
No exact OS matches for host (If you know what OS is running on it, see https://nmap.org/submit/ ).
TCP/IP fingerprint:
OS:SCAN(V=7.80%E=4%D=8/5%OT=22%CT=1%CU=2%PV=Y%DS=2%DC=T%G=Y%TM=610C6FC5%P=x
OS:86_64-pc-linux-gnu)SEQ(SP=107%GCD=1%ISR=109%TI=Z%CI=Z%II=I%TS=A)OPS(O1=M
OS:5B4ST11NW6%O2=M5B4ST11NW6%O3=M5B4NNT11NW6%O4=M5B4ST11NW6%O5=M5B4ST11NW6%
OS:O6=M5B4ST11)WIN(W1=FE88%W2=FE88%W3=FE88%W4=FE88%W5=FE88%W6=FE88)ECN(R=Y%
OS:DF=Y%T=40%W=FAF0%O=M5B4NNSNW6%CC=Y%Q=)T1(R=Y%DF=Y%T=40%S=O%A=S+%F=AS%RD=
OS:0%Q=)T2(R=N)T3(R=N)T4(R=Y%DF=Y%T=40%W=0%S=A%A=Z%F=R%O=%RD=0%Q=)T5(R=Y%DF
OS:=Y%T=40%W=0%S=Z%A=S+%F=AR%O=%RD=0%Q=)T6(R=Y%DF=Y%T=40%W=0%S=A%A=Z%F=R%O=
OS:%RD=0%Q=)T7(R=Y%DF=Y%T=40%W=0%S=Z%A=S+%F=AR%O=%RD=0%Q=)U1(R=Y%DF=N%T=40%
OS:IPL=164%UN=0%RIPL=G%RID=G%RIPCK=G%RUCK=G%RUD=G)IE(R=Y%DFI=N%T=40%CD=S)

Uptime guess: 33.848 days (since Fri Jul  2 23:48:46 2021)
Network Distance: 2 hops
TCP Sequence Prediction: Difficulty=263 (Good luck!)
IP ID Sequence Generation: All zeros
Service Info: Host: RTR-UBNT-02; OS: Linux; CPE: cpe:/o:linux:linux_kernel

Host script results:
| nbstat: NetBIOS name: RTR-UBNT-02, NetBIOS user: <unknown>, NetBIOS MAC: <unknown> (unknown)
| Names:
|   RTR-UBNT-02<00>      Flags: <unique><active>
|   RTR-UBNT-02<03>      Flags: <unique><active>
|   RTR-UBNT-02<20>      Flags: <unique><active>
|   \x01\x02__MSBROWSE__\x02<01>  Flags: <group><active>
|   THEFORCE<00>         Flags: <group><active>
|   THEFORCE<1b>         Flags: <unique><active>
|   THEFORCE<1c>         Flags: <unique><active>
|   THEFORCE<1d>         Flags: <unique><active>
|_  THEFORCE<1e>         Flags: <group><active>
| smb2-security-mode:
|   2.02:
|_    Message signing enabled but not required
| smb2-time:
|   date: 2021-08-05T23:08:59
|_  start_date: N/A

TRACEROUTE (using port 1720/tcp)
HOP RTT     ADDRESS
1   0.14 ms _gateway (172.18.2.1)
2   0.51 ms 172.17.15.1

Initiating SYN Stealth Scan at 20:09
Scanning 172.17.15.1 [1000 ports]
Discovered open port 53/tcp on 172.17.15.1
Discovered open port 139/tcp on 172.17.15.1
Discovered open port 445/tcp on 172.17.15.1
Discovered open port 80/tcp on 172.17.15.1
Discovered open port 111/tcp on 172.17.15.1
Discovered open port 22/tcp on 172.17.15.1
Discovered open port 389/tcp on 172.17.15.1
Discovered open port 3260/tcp on 172.17.15.1
Completed SYN Stealth Scan at 20:09, 0.45s elapsed (1000 total ports)
Initiating UDP Scan at 20:09
Scanning 172.17.15.1 [1000 ports]
Increasing send delay for 172.17.15.1 from 0 to 50 due to 11 out of 12 dropped probes since last increase.
UDP Scan Timing: About 12.02% done; ETC: 20:14 (0:03:47 remaining)
Discovered open port 137/udp on 172.17.15.1
Increasing send delay for 172.17.15.1 from 50 to 100 due to max_successful_tryno increase to 5
Increasing send delay for 172.17.15.1 from 100 to 200 due to max_successful_tryno increase to 6
Warning: 172.17.15.1 giving up on port because retransmission cap hit (6).
UDP Scan Timing: About 15.66% done; ETC: 20:16 (0:05:29 remaining)
Increasing send delay for 172.17.15.1 from 200 to 400 due to 12 out of 29 dropped probes since last increase.
Increasing send delay for 172.17.15.1 from 400 to 800 due to 11 out of 11 dropped probes since last increase.
UDP Scan Timing: About 18.99% done; ETC: 20:17 (0:06:28 remaining)
UDP Scan Timing: About 21.97% done; ETC: 20:19 (0:07:10 remaining)
UDP Scan Timing: About 26.87% done; ETC: 20:20 (0:07:40 remaining)
UDP Scan Timing: About 44.60% done; ETC: 20:22 (0:07:06 remaining)
Discovered open port 53/udp on 172.17.15.1
UDP Scan Timing: About 51.74% done; ETC: 20:23 (0:06:24 remaining)
Discovered open port 111/udp on 172.17.15.1
UDP Scan Timing: About 58.19% done; ETC: 20:23 (0:05:41 remaining)
UDP Scan Timing: About 64.10% done; ETC: 20:23 (0:04:58 remaining)
UDP Scan Timing: About 69.93% done; ETC: 20:23 (0:04:13 remaining)
UDP Scan Timing: About 75.46% done; ETC: 20:24 (0:03:29 remaining)
UDP Scan Timing: About 80.97% done; ETC: 20:24 (0:02:44 remaining)
UDP Scan Timing: About 86.19% done; ETC: 20:24 (0:02:00 remaining)
UDP Scan Timing: About 91.40% done; ETC: 20:24 (0:01:15 remaining)
Completed UDP Scan at 20:25, 932.14s elapsed (1000 total ports)
Initiating Service scan at 20:25
Scanning 81 services on 172.17.15.1
Service scan Timing: About 14.81% done; ETC: 20:32 (0:06:14 remaining)
Service scan Timing: About 45.68% done; ETC: 20:29 (0:01:57 remaining)
Service scan Timing: About 64.20% done; ETC: 20:29 (0:01:35 remaining)
Completed Service scan at 20:29, 226.22s elapsed (81 services on 1 host)
Initiating OS detection (try #1) against 172.17.15.1
Retrying OS detection (try #2) against 172.17.15.1
Retrying OS detection (try #3) against 172.17.15.1
Retrying OS detection (try #4) against 172.17.15.1
Retrying OS detection (try #5) against 172.17.15.1
Initiating Traceroute at 20:29
Completed Traceroute at 20:29, 0.02s elapsed
Initiating Parallel DNS resolution of 2 hosts. at 20:29
Completed Parallel DNS resolution of 2 hosts. at 20:29, 0.06s elapsed
NSE: Script scanning 172.17.15.1.
Initiating NSE at 20:29
Completed NSE at 20:32, 166.71s elapsed
Initiating NSE at 20:32
Completed NSE at 20:32, 4.74s elapsed
Initiating NSE at 20:32
Completed NSE at 20:32, 0.01s elapsed
Nmap scan report for 172.17.15.1
Host is up (0.0026s latency).
Not shown: 1919 closed ports, 70 open|filtered ports
PORT     STATE SERVICE     VERSION
22/tcp   open  ssh         OpenSSH 8.2p1 Ubuntu 4ubuntu0.2 (Ubuntu Linux; protocol 2.0)
53/tcp   open  domain      ISC BIND 9.16.1 (Ubuntu Linux)
80/tcp   open  http        nginx 1.18.0 (Ubuntu)
| http-methods:
|_  Supported Methods: GET HEAD
|_http-server-header: nginx/1.18.0 (Ubuntu)
|_http-title: Apache2 Ubuntu Default Page: It works
111/tcp  open  rpcbind     2-4 (RPC #100000)
| rpcinfo:
|   program version    port/proto  service
|   100000  2,3,4        111/tcp   rpcbind
|   100000  2,3,4        111/udp   rpcbind
|   100000  3,4          111/tcp6  rpcbind
|_  100000  3,4          111/udp6  rpcbind
139/tcp  open  netbios-ssn Samba smbd 4.6.2
389/tcp  open  ldap        OpenLDAP 2.2.X - 2.3.X
445/tcp  open  netbios-ssn Samba smbd 4.6.2
3260/tcp open  tcpwrapped
53/udp   open  domain      ISC BIND 9.16.1 (Ubuntu Linux)
| dns-nsid:
|_  bind.version: 9.16.1-Ubuntu
111/udp  open  rpcbind     2-4 (RPC #100000)
| rpcinfo:
|   program version    port/proto  service
|   100000  2,3,4        111/tcp   rpcbind
|   100000  2,3,4        111/udp   rpcbind
|   100000  3,4          111/tcp6  rpcbind
|_  100000  3,4          111/udp6  rpcbind
137/udp  open  netbios-ns  Samba nmbd netbios-ns (workgroup: THEFORCE)
No exact OS matches for host (If you know what OS is running on it, see https://nmap.org/submit/ ).
TCP/IP fingerprint:
OS:SCAN(V=7.80%E=4%D=8/5%OT=22%CT=1%CU=2%PV=Y%DS=2%DC=T%G=Y%TM=610C7503%P=x
OS:86_64-pc-linux-gnu)SEQ(SP=103%GCD=1%ISR=10D%TI=Z%CI=Z%II=I%TS=A)OPS(O1=M
OS:5B4ST11NW6%O2=M5B4ST11NW6%O3=M5B4NNT11NW6%O4=M5B4ST11NW6%O5=M5B4ST11NW6%
OS:O6=M5B4ST11)WIN(W1=FE88%W2=FE88%W3=FE88%W4=FE88%W5=FE88%W6=FE88)ECN(R=Y%
OS:DF=Y%T=40%W=FAF0%O=M5B4NNSNW6%CC=Y%Q=)T1(R=Y%DF=Y%T=40%S=O%A=S+%F=AS%RD=
OS:0%Q=)T2(R=N)T3(R=N)T4(R=Y%DF=Y%T=40%W=0%S=A%A=Z%F=R%O=%RD=0%Q=)T5(R=Y%DF
OS:=Y%T=40%W=0%S=Z%A=S+%F=AR%O=%RD=0%Q=)T6(R=Y%DF=Y%T=40%W=0%S=A%A=Z%F=R%O=
OS:%RD=0%Q=)T7(R=Y%DF=Y%T=40%W=0%S=Z%A=S+%F=AR%O=%RD=0%Q=)U1(R=Y%DF=N%T=40%
OS:IPL=164%UN=0%RIPL=G%RID=G%RIPCK=G%RUCK=G%RUD=G)IE(R=Y%DFI=N%T=40%CD=S)

Uptime guess: 33.864 days (since Fri Jul  2 23:48:46 2021)
Network Distance: 2 hops
TCP Sequence Prediction: Difficulty=259 (Good luck!)
IP ID Sequence Generation: All zeros
Service Info: Host: RTR-UBNT-02; OS: Linux; CPE: cpe:/o:linux:linux_kernel

Host script results:
|_clock-skew: -1s
| nbstat: NetBIOS name: RTR-UBNT-02, NetBIOS user: <unknown>, NetBIOS MAC: <unknown> (unknown)
| Names:
|   RTR-UBNT-02<00>      Flags: <unique><active>
|   RTR-UBNT-02<03>      Flags: <unique><active>
|   RTR-UBNT-02<20>      Flags: <unique><active>
|   \x01\x02__MSBROWSE__\x02<01>  Flags: <group><active>
|   THEFORCE<00>         Flags: <group><active>
|   THEFORCE<1b>         Flags: <unique><active>
|   THEFORCE<1c>         Flags: <unique><active>
|   THEFORCE<1d>         Flags: <unique><active>
|_  THEFORCE<1e>         Flags: <group><active>
| smb2-security-mode:
|   2.02:
|_    Message signing enabled but not required
| smb2-time:
|   date: 2021-08-05T23:29:28
|_  start_date: N/A

TRACEROUTE (using port 1720/tcp)
HOP RTT     ADDRESS
1   0.14 ms _gateway (172.18.2.1)
2   0.51 ms 172.17.15.1

NSE: Script Post-scanning.
Initiating NSE at 20:32
Completed NSE at 20:32, 0.00s elapsed
Initiating NSE at 20:32
Completed NSE at 20:32, 0.00s elapsed
Initiating NSE at 20:32
Completed NSE at 20:32, 0.00s elapsed
Read data files from: /usr/bin/../share/nmap
OS and Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 2 IP addresses (2 hosts up) scanned in 2491.31 seconds
           Raw packets sent: 5529 (206.033KB) | Rcvd: 4230 (208.491KB)

```

#### Vermelho

```bash
root@clt-ubnt-01:~# nmap -sS -sU -T4 -A -O -v 172.17.15.1 172.17.15.1
Starting Nmap 6.40 ( http://nmap.org ) at 2021-08-05 19:50 -03
NSE: Loaded 110 scripts for scanning.
NSE: Script Pre-scanning.
Initiating Ping Scan at 19:50
Scanning 172.18.2.1 [4 ports]
Completed Ping Scan at 19:50, 0.20s elapsed (1 total hosts)
Initiating Parallel DNS resolution of 1 host. at 19:50
Completed Parallel DNS resolution of 1 host. at 19:50, 11.01s elapsed
Initiating Ping Scan at 19:50
Scanning 172.18.2.1 [4 ports]
Completed Ping Scan at 19:50, 0.20s elapsed (1 total hosts)
Initiating Parallel DNS resolution of 1 host. at 19:50
Completed Parallel DNS resolution of 1 host. at 19:51, 11.01s elapsed
Initiating SYN Stealth Scan at 19:51
Scanning 172.18.2.1 [1000 ports]
Discovered open port 22/tcp on 172.18.2.1
Discovered open port 53/tcp on 172.18.2.1
Discovered open port 80/tcp on 172.18.2.1
Discovered open port 389/tcp on 172.18.2.1
Completed SYN Stealth Scan at 19:51, 1.42s elapsed (1000 total ports)
Initiating UDP Scan at 19:51
Scanning 172.18.2.1 [1000 ports]
Increasing send delay for 172.18.2.1 from 0 to 50 due to max_successful_tryno increase to 5
Increasing send delay for 172.18.2.1 from 50 to 100 due to max_successful_tryno increase to 6
Warning: 172.18.2.1 giving up on port because retransmission cap hit (6).
Increasing send delay for 172.18.2.1 from 100 to 200 due to 11 out of 15 dropped probes since last increase.
UDP Scan Timing: About 7.34% done; ETC: 19:58 (0:06:31 remaining)
Increasing send delay for 172.18.2.1 from 200 to 400 due to 11 out of 11 dropped probes since last increase.
Increasing send delay for 172.18.2.1 from 400 to 800 due to 11 out of 11 dropped probes since last increase.
UDP Scan Timing: About 10.63% done; ETC: 20:00 (0:08:33 remaining)
UDP Scan Timing: About 13.69% done; ETC: 20:02 (0:09:34 remaining)
UDP Scan Timing: About 18.60% done; ETC: 20:03 (0:10:08 remaining)
Discovered open port 53/udp on 172.18.2.1
UDP Scan Timing: About 32.50% done; ETC: 20:05 (0:09:29 remaining)
UDP Scan Timing: About 39.26% done; ETC: 20:05 (0:08:46 remaining)
Stats: 0:06:22 elapsed; 0 hosts completed (1 up), 1 undergoing UDP Scan
UDP Scan Timing: About 41.09% done; ETC: 20:05 (0:08:33 remaining)
UDP Scan Timing: About 46.93% done; ETC: 20:05 (0:07:49 remaining)
Stats: 0:07:47 elapsed; 0 hosts completed (1 up), 1 undergoing UDP Scan
UDP Scan Timing: About 49.79% done; ETC: 20:05 (0:07:27 remaining)
Stats: 0:08:10 elapsed; 0 hosts completed (1 up), 1 undergoing UDP Scan
UDP Scan Timing: About 52.14% done; ETC: 20:05 (0:07:08 remaining)
UDP Scan Timing: About 57.59% done; ETC: 20:06 (0:06:23 remaining)
UDP Scan Timing: About 63.20% done; ETC: 20:06 (0:05:34 remaining)
UDP Scan Timing: About 68.43% done; ETC: 20:06 (0:04:48 remaining)
UDP Scan Timing: About 73.64% done; ETC: 20:06 (0:04:02 remaining)
UDP Scan Timing: About 78.86% done; ETC: 20:06 (0:03:15 remaining)
UDP Scan Timing: About 84.07% done; ETC: 20:06 (0:02:27 remaining)
UDP Scan Timing: About 89.20% done; ETC: 20:06 (0:01:40 remaining)
UDP Scan Timing: About 94.51% done; ETC: 20:06 (0:00:51 remaining)
Completed UDP Scan at 20:07, 978.71s elapsed (1000 total ports)
Initiating Service scan at 20:07
Scanning 21 services on 172.18.2.1
Service scan Timing: About 28.57% done; ETC: 20:09 (0:01:35 remaining)
Stats: 0:17:38 elapsed; 0 hosts completed (1 up), 1 undergoing Service Scan
Service scan Timing: About 42.86% done; ETC: 20:09 (0:01:13 remaining)
Completed Service scan at 20:08, 72.58s elapsed (21 services on 1 host)
Initiating OS detection (try #1) against 172.18.2.1
Retrying OS detection (try #2) against 172.18.2.1
adjust_timeouts2: packet supposedly had rtt of -125012 microseconds.  Ignoring time.
adjust_timeouts2: packet supposedly had rtt of -125012 microseconds.  Ignoring time.
Retrying OS detection (try #3) against 172.18.2.1
Retrying OS detection (try #4) against 172.18.2.1
adjust_timeouts2: packet supposedly had rtt of -159633 microseconds.  Ignoring time.
adjust_timeouts2: packet supposedly had rtt of -159633 microseconds.  Ignoring time.
Retrying OS detection (try #5) against 172.18.2.1
Initiating Traceroute at 20:08
Completed Traceroute at 20:08, 0.01s elapsed
Initiating Parallel DNS resolution of 2 hosts. at 20:08
Completed Parallel DNS resolution of 2 hosts. at 20:09, 11.00s elapsed
NSE: Script scanning 172.18.2.1.
Initiating NSE at 20:09
Completed NSE at 20:09, 30.32s elapsed
Nmap scan report for 172.18.2.1
Host is up (0.0021s latency).
Not shown: 1979 closed ports
PORT      STATE         SERVICE VERSION
22/tcp    open          ssh     OpenSSH 7.4 (protocol 2.0)
| ssh-hostkey: 2048 e6:28:28:5b:95:70:81:05:39:58:ce:ab:c9:6f:27:69 (RSA)
|_256 5f:33:de:cb:e4:8e:8b:f9:1b:85:3e:0b:54:d9:12:40 (ECDSA)
53/tcp    open          domain
| dns-nsid:
|_  bind.version: 9.11.4-P2-RedHat-9.11.4-26.P2.el7_9.5
80/tcp    open          http    nginx 1.20.1
|_http-methods: POST OPTIONS HEAD GET
|_http-title: Apache2 Ubuntu Default Page: It works
389/tcp   open          ldap    OpenLDAP 2.2.X - 2.3.X
22/udp    open|filtered ssh
53/udp    open          domain
| dns-nsid:
|_  bind.version: 9.11.4-P2-RedHat-9.11.4-26.P2.el7_9.5
2362/udp  open|filtered digiman
16498/udp open|filtered unknown
17332/udp open|filtered unknown
17629/udp open|filtered unknown
18081/udp open|filtered unknown
19728/udp open|filtered unknown
19936/udp open|filtered unknown
20309/udp open|filtered unknown
20313/udp open|filtered unknown
20423/udp open|filtered unknown
33354/udp open|filtered unknown
38498/udp open|filtered unknown
40732/udp open|filtered unknown
53006/udp open|filtered unknown
62699/udp open|filtered unknown
No exact OS matches for host (If you know what OS is running on it, see http://nmap.org/submit/ ).
TCP/IP fingerprint:
OS:SCAN(V=6.40%E=4%D=8/5%OT=22%CT=1%CU=2%PV=Y%DS=2%DC=T%G=Y%TM=610C6FAC%P=x
OS:86_64-redhat-linux-gnu)SEQ(SP=106%GCD=1%ISR=10D%TI=Z%TS=A)SEQ(SP=106%GCD
OS:=1%ISR=10D%TI=Z%II=I%TS=A)SEQ(SP=106%GCD=1%ISR=10D%TI=Z%CI=I%TS=A)OPS(O1
OS:=M5B4ST11NW6%O2=M5B4ST11NW6%O3=M5B4NNT11NW6%O4=M5B4ST11NW6%O5=M5B4ST11NW
OS:6%O6=M5B4ST11)WIN(W1=7120%W2=7120%W3=7120%W4=7120%W5=7120%W6=7120)ECN(R=
OS:Y%DF=Y%T=40%W=7210%O=M5B4NNSNW6%CC=Y%Q=)T1(R=Y%DF=Y%T=40%S=O%A=S+%F=AS%R
OS:D=0%Q=)T2(R=N)T3(R=N)T4(R=Y%DF=Y%T=40%W=0%S=A%A=Z%F=R%O=%RD=0%Q=)T5(R=Y%
OS:DF=Y%T=40%W=0%S=Z%A=S+%F=AR%O=%RD=0%Q=)T6(R=Y%DF=Y%T=40%W=0%S=A%A=Z%F=R%
OS:O=%RD=0%Q=)T7(R=Y%DF=Y%T=40%W=0%S=Z%A=S+%F=AR%O=%RD=0%Q=)U1(R=Y%DF=N%T=4
OS:0%IPL=164%UN=0%RIPL=G%RID=G%RIPCK=G%RUCK=G%RUD=G)IE(R=Y%DFI=N%T=40%CD=S)

Uptime guess: 0.029 days (since Thu Aug  5 19:27:38 2021)
Network Distance: 2 hops
TCP Sequence Prediction: Difficulty=262 (Good luck!)
IP ID Sequence Generation: All zeros

TRACEROUTE (using port 135/tcp)
HOP RTT     ADDRESS
1   0.74 ms 172.17.15.1
2   2.15 ms 172.18.2.1

Initiating SYN Stealth Scan at 20:09
Scanning 172.18.2.1 [1000 ports]
Discovered open port 22/tcp on 172.18.2.1
Discovered open port 53/tcp on 172.18.2.1
Discovered open port 80/tcp on 172.18.2.1
Discovered open port 389/tcp on 172.18.2.1
Completed SYN Stealth Scan at 20:09, 1.60s elapsed (1000 total ports)
Initiating UDP Scan at 20:09
Scanning 172.18.2.1 [1000 ports]
Increasing send delay for 172.18.2.1 from 0 to 50 due to max_successful_tryno increase to 5
Increasing send delay for 172.18.2.1 from 50 to 100 due to max_successful_tryno increase to 6
Warning: 172.18.2.1 giving up on port because retransmission cap hit (6).
Increasing send delay for 172.18.2.1 from 100 to 200 due to 11 out of 12 dropped probes since last increase.
Increasing send delay for 172.18.2.1 from 200 to 400 due to 11 out of 11 dropped probes since last increase.
UDP Scan Timing: About 7.20% done; ETC: 20:16 (0:06:40 remaining)
Increasing send delay for 172.18.2.1 from 400 to 800 due to 11 out of 11 dropped probes since last increase.
UDP Scan Timing: About 10.39% done; ETC: 20:19 (0:08:46 remaining)
UDP Scan Timing: About 13.44% done; ETC: 20:20 (0:09:46 remaining)
UDP Scan Timing: About 18.27% done; ETC: 20:22 (0:10:22 remaining)
Discovered open port 53/udp on 172.18.2.1
UDP Scan Timing: About 30.73% done; ETC: 20:23 (0:09:44 remaining)
UDP Scan Timing: About 37.79% done; ETC: 20:24 (0:09:00 remaining)
UDP Scan Timing: About 43.93% done; ETC: 20:24 (0:08:15 remaining)
UDP Scan Timing: About 49.76% done; ETC: 20:24 (0:07:29 remaining)
UDP Scan Timing: About 55.29% done; ETC: 20:24 (0:06:44 remaining)
UDP Scan Timing: About 60.71% done; ETC: 20:24 (0:05:58 remaining)
UDP Scan Timing: About 66.03% done; ETC: 20:24 (0:05:11 remaining)
UDP Scan Timing: About 71.23% done; ETC: 20:24 (0:04:25 remaining)
UDP Scan Timing: About 76.46% done; ETC: 20:24 (0:03:37 remaining)
UDP Scan Timing: About 81.67% done; ETC: 20:25 (0:02:50 remaining)
UDP Scan Timing: About 86.80% done; ETC: 20:25 (0:02:03 remaining)
UDP Scan Timing: About 92.11% done; ETC: 20:25 (0:01:14 remaining)
Completed UDP Scan at 20:25, 979.25s elapsed (1000 total ports)
Initiating Service scan at 20:25
Scanning 20 services on 172.18.2.1
Service scan Timing: About 30.00% done; ETC: 20:28 (0:01:45 remaining)
Completed Service scan at 20:27, 72.62s elapsed (20 services on 1 host)
Initiating OS detection (try #1) against 172.18.2.1
Retrying OS detection (try #2) against 172.18.2.1
Retrying OS detection (try #3) against 172.18.2.1
adjust_timeouts2: packet supposedly had rtt of -152658 microseconds.  Ignoring time.
adjust_timeouts2: packet supposedly had rtt of -152658 microseconds.  Ignoring time.
Retrying OS detection (try #4) against 172.18.2.1
Retrying OS detection (try #5) against 172.18.2.1
adjust_timeouts2: packet supposedly had rtt of -154391 microseconds.  Ignoring time.
adjust_timeouts2: packet supposedly had rtt of -154391 microseconds.  Ignoring time.
Initiating Traceroute at 20:27
Completed Traceroute at 20:27, 0.01s elapsed
Initiating Parallel DNS resolution of 2 hosts. at 20:27
Completed Parallel DNS resolution of 2 hosts. at 20:27, 11.00s elapsed
NSE: Script scanning 172.18.2.1.
Initiating NSE at 20:27
Completed NSE at 20:28, 30.25s elapsed
Nmap scan report for 172.18.2.1
Host is up (0.0024s latency).
Not shown: 1980 closed ports
PORT      STATE         SERVICE        VERSION
22/tcp    open          ssh            OpenSSH 7.4 (protocol 2.0)
| ssh-hostkey: 2048 e6:28:28:5b:95:70:81:05:39:58:ce:ab:c9:6f:27:69 (RSA)
|_256 5f:33:de:cb:e4:8e:8b:f9:1b:85:3e:0b:54:d9:12:40 (ECDSA)
53/tcp    open          domain
| dns-nsid:
|_  bind.version: 9.11.4-P2-RedHat-9.11.4-26.P2.el7_9.5
80/tcp    open          http           nginx 1.20.1
|_http-methods: POST OPTIONS HEAD GET
|_http-title: Apache2 Ubuntu Default Page: It works
389/tcp   open          ldap           OpenLDAP 2.2.X - 2.3.X
22/udp    open|filtered ssh
53/udp    open          domain
| dns-nsid:
|_  bind.version: 9.11.4-P2-RedHat-9.11.4-26.P2.el7_9.5
363/udp   open|filtered rsvp_tunnel
593/udp   open|filtered http-rpc-epmap
1049/udp  open|filtered td-postman
16498/udp open|filtered unknown
17219/udp open|filtered chipper
20279/udp open|filtered unknown
20309/udp open|filtered unknown
20366/udp open|filtered unknown
20423/udp open|filtered unknown
21360/udp open|filtered unknown
32345/udp open|filtered unknown
38498/udp open|filtered unknown
53006/udp open|filtered unknown
62699/udp open|filtered unknown
No exact OS matches for host (If you know what OS is running on it, see http://nmap.org/submit/ ).
TCP/IP fingerprint:
OS:SCAN(V=6.40%E=4%D=8/5%OT=22%CT=1%CU=2%PV=Y%DS=2%DC=T%G=Y%TM=610C7400%P=x
OS:86_64-redhat-linux-gnu)SEQ(SP=103%GCD=1%ISR=108%TI=Z%TS=A)SEQ(SP=103%GCD
OS:=1%ISR=108%TI=Z%II=I%TS=A)OPS(O1=M5B4ST11NW6%O2=M5B4ST11NW6%O3=M5B4NNT11
OS:NW6%O4=M5B4ST11NW6%O5=M5B4ST11NW6%O6=M5B4ST11)WIN(W1=7120%W2=7120%W3=712
OS:0%W4=7120%W5=7120%W6=7120)ECN(R=Y%DF=Y%T=40%W=7210%O=M5B4NNSNW6%CC=Y%Q=)
OS:T1(R=Y%DF=Y%T=40%S=O%A=S+%F=AS%RD=0%Q=)T2(R=N)T3(R=N)T4(R=Y%DF=Y%T=40%W=
OS:0%S=A%A=Z%F=R%O=%RD=0%Q=)T5(R=Y%DF=Y%T=40%W=0%S=Z%A=S+%F=AR%O=%RD=0%Q=)T
OS:6(R=Y%DF=Y%T=40%W=0%S=A%A=Z%F=R%O=%RD=0%Q=)T7(R=Y%DF=Y%T=40%W=0%S=Z%A=S+
OS:%F=AR%O=%RD=0%Q=)U1(R=Y%DF=N%T=40%IPL=164%UN=0%RIPL=G%RID=G%RIPCK=G%RUCK
OS:=G%RUD=G)IE(R=Y%DFI=N%T=40%CD=S)

Uptime guess: 0.042 days (since Thu Aug  5 19:27:39 2021)
Network Distance: 2 hops
TCP Sequence Prediction: Difficulty=259 (Good luck!)
IP ID Sequence Generation: All zeros

TRACEROUTE (using port 135/tcp)
HOP RTT     ADDRESS
1   0.74 ms 172.17.15.1
2   2.15 ms 172.18.2.1

NSE: Script Post-scanning.
Initiating NSE at 20:28
Completed NSE at 20:28, 0.00s elapsed
Read data files from: /usr/bin/../share/nmap
OS and Service detection performed. Please report any incorrect results at http://nmap.org/submit/ .
Nmap done: 2 IP addresses (2 hosts up) scanned in 2239.05 seconds
           Raw packets sent: 5526 (215.848KB) | Rcvd: 4585 (231.446KB)

```

## Respostas

[Respostas](respostas01.md)
