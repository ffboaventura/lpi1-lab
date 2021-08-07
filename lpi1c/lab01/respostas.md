---
template: index
title: Lab-01 - Discos, Partições e Arquivos de Sistemas
sitename: LPIC-I - Laboratório 01
---


[Lista de Comandos](../comandos.md)

## Requisitos

### VirtualBox

- Criar dois discos adicionais
- Adicionar um disco a cada uma das máquinas (CentOS e Ubuntu)

### VMs

- Instalar os pacotes
  - Ubuntu

    `sudo apt install -y btrfs-progs dosfstools`

  - CentOS

    `sudo yum install -y btrfs-progs dosfstools`


## Objetivos

### Partições

1. Identificar o novo disco adicionado à máquina

`sudo fdisk -l | grep "^Disk"`

```bash
[aluno@centos01 ~]$ sudo fdisk -l | grep "^Disk"
Disk /dev/sda: 21.5 GB, 21474836480 bytes, 41943040 sectors
Disk label type: dos
Disk identifier: 0x000cc1db
Disk /dev/sdb: 1073 MB, 1073741824 bytes, 2097152 sectors
Disk /dev/mapper/centos_centos01-root: 18.2 GB, 18249416704 bytes, 35643392 sectors
Disk /dev/mapper/centos_centos01-swap: 2147 MB, 2147483648 bytes, 4194304 sectors
```

`dmesg | grep sd`

```bash
[aluno@centos01 ~]$ dmesg | grep sd
[...]
[    4.616047] sd 2:0:0:0: [sda] Attached SCSI disk
[    4.616219] sd 3:0:0:0: [sdb] 2097152 512-byte logical blocks: (1.07 GB/1.00 GiB)
[    4.616260] sd 3:0:0:0: [sdb] Write Protect is off
[    4.616264] sd 3:0:0:0: [sdb] Mode Sense: 00 3a 00 00
[    4.616282] sd 3:0:0:0: [sdb] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
[    4.617898] sd 3:0:0:0: [sdb] Attached SCSI disk
[...]
```

2. Editar a tabela de partições do disco:

    `sudo fdisk /dev/sdb`

    1. Adicionar uma nova partição

    ```
    Command (m for help): n
    Partition type:
    p   primary (0 primary, 0 extended, 4 free)
    e   extended
    Select (default p): p
    Partition number (1-4, default 1): 1
    First sector (2048-2097151, default 2048):
    Using default value 2048
    Last sector, +sectors or +size{K,M,G} (2048-2097151, default 2097151): +500M
    Partition 1 of type Linux and of size 500 MiB is set

    Command (m for help): w
    The partition table has been altered!

    Calling ioctl() to re-read partition table.
    Syncing disks.
    ```

    2. Listar e identificar no S.O. a partição criada

    ```
    ls -l /dev/sdb*
    ```

    3. Apagar a partição

    `sudo fdisk /dev/sdb`

    ```
    Command (m for help): d
    Selected partition 1
    Partition 1 is deleted

    Command (m for help): w
    The partition table has been altered!

    Calling ioctl() to re-read partition table.
    Syncing disks.
    ```
    4. Verificar no S.O. que a partição foi removida

    ```
    ls -l /dev/sdb*
    ```

    5. Adicionar duas novas partições com tipo 83

    `sudo fdisk /dev/sdb`

    ```
    Command (m for help): n
    Partition type:
    p   primary (0 primary, 0 extended, 4 free)
    e   extended
    Select (default p): p
    Partition number (1-4, default 1): 1
    First sector (2048-2097151, default 2048):
    Using default value 2048
    Last sector, +sectors or +size{K,M,G} (2048-2097151, default 2097151): +500M
    Partition 1 of type Linux and of size 500 MiB is set

    Command (m for help): n
    Partition type:
    p   primary (1 primary, 0 extended, 3 free)
    e   extended
    Select (default p): p
    Partition number (2-4, default 2):
    First sector (1026048-2097151, default 1026048):
    Using default value 1026048
    Last sector, +sectors or +size{K,M,G} (1026048-2097151, default 2097151): +100M
    Partition 2 of type Linux and of size 100 MiB is set

    Command (m for help): w
    The partition table has been altered!

    Calling ioctl() to re-read partition table.
    Syncing disks.
    ```

    6. Verificar no S.O. que as partições foram criadas

    ```
    ls -l /dev/sdb*
    ```

3. Criar um sistema de arquivos em cada uma das partições criadas

```
sudo mkfs.ext4 /dev/sdb1
sudo mkfs.ext4 /dev/sdb2
```

```
[aluno@centos01 ~]$ sudo mkfs.ext4 /dev/sdb2
mke2fs 1.42.9 (28-Dec-2013)
Filesystem label=
OS type: Linux
Block size=1024 (log=0)
Fragment size=1024 (log=0)
Stride=0 blocks, Stripe width=0 blocks
25688 inodes, 102400 blocks
5120 blocks (5.00%) reserved for the super user
First data block=1
Maximum filesystem blocks=33685504
13 block groups
8192 blocks per group, 8192 fragments per group
1976 inodes per group
Superblock backups stored on blocks:
        8193, 24577, 40961, 57345, 73729

Allocating group tables: done
Writing inode tables: done
Creating journal (4096 blocks): done
Writing superblocks and filesystem accounting information: done
```

4. Criar um diretório para cada uma das partições dentro do diretório `/mnt`

```
sudo mkdir /mnt/dir1
sudo mkdir /mnt/dir2

[aluno@centos01 ~]$ sudo ls -l /mnt
total 0
drwxr-xr-x. 2 root root 6 Jun 30 21:26 dir1
drwxr-xr-x. 2 root root 6 Jun 30 21:26 dir2
```


5. Montar cada uma das partições no respectivo diretório

```
sudo mount /dev/sdb1 /mnt/dir1
sudo mount -t ext4 /dev/sdb2 /mnt/dir2
```

6. Verificar que as partições estão montadas corretamente no S.O.

```
[aluno@centos01 ~]$ sudo ls -l /mnt/dir*
/mnt/dir1:
total 12
drwx------. 2 root root 12288 Jun 30 21:23 lost+found

/mnt/dir2:
total 12
drwx------. 2 root root 12288 Jun 30 21:23 lost+found
```

7. Gravar arquivos dentro de uma das partições

```
sudo touch /mnt/dir1/arq1
sudo touch /mnt/dir2/arq1

[aluno@centos01 ~]$ sudo ls -l /mnt/dir*
/mnt/dir1:
total 13
-rw-r--r--. 1 root root     0 Jun 30 21:28 arq1
drwx------. 2 root root 12288 Jun 30 21:23 lost+found

/mnt/dir2:
total 13
-rw-r--r--. 1 root root     0 Jun 30 21:28 arq1
drwx------. 2 root root 12288 Jun 30 21:23 lost+found
```

8. Desmontar partições

```
sudo umount /mnt/dir1
sudo umount /mnt/dir2
```

9. Remover as partições existentes

```
sudo fdisk /dev/sdb

Command (m for help): d
Partition number (1,2, default 2): 1
Partition 1 is deleted

Command (m for help): d
Selected partition 2
Partition 2 is deleted

Command (m for help): w
The partition table has been altered!

Calling ioctl() to re-read partition table.
Syncing disks.

```

### LVM

1. Criar um Physical Volume (`PV`) com o disco adicionado

```
[aluno@centos01 ~]$ sudo pvcreate /dev/sdb
WARNING: dos signature detected on /dev/sdb at offset 510. Wipe it? [y/n]: y
  Wiping dos signature on /dev/sdb.
  Physical volume "/dev/sdb" successfully created.
```

2. Verificar que o PV está criado

```
[aluno@centos01 ~]$ sudo pvs
  PV         VG              Fmt  Attr PSize   PFree
  /dev/sda2  centos_centos01 lvm2 a--  <19,00g    0
  /dev/sdb                   lvm2 ---    1,00g 1,00g
```

```
[aluno@centos01 ~]$ sudo pvdisplay /dev/sdb
  "/dev/sdb" is a new physical volume of "1,00 GiB"
  --- NEW Physical volume ---
  PV Name               /dev/sdb
  VG Name
  PV Size               1,00 GiB
  Allocatable           NO
  PE Size               0
  Total PE              0
  Free PE               0
  Allocated PE          0
  PV UUID               NV9dT4-KUgw-g9uV-Jpxe-fw45-Ah6D-6QKodg
```

3. Criar um Volume Group (`VG`) utilizando o PV criado

```
[aluno@centos01 ~]$ sudo vgcreate vg_data /dev/sdb
Volume group "vg_data" successfully created
```

4. Verificar que o VG está criado

```
[aluno@centos01 ~]$ sudo vgs
VG              #PV #LV #SN Attr   VSize    VFree
centos_centos01   1   2   0 wz--n-  <19,00g       0
vg_data           1   0   0 wz--n- 1020,00m 1020,00m
```

```
[aluno@centos01 ~]$ sudo vgdisplay vg_data
--- Volume group ---
VG Name               vg_data
System ID
Format                lvm2
Metadata Areas        1
Metadata Sequence No  1
VG Access             read/write
VG Status             resizable
MAX LV                0
Cur LV                0
Open LV               0
Max PV                0
Cur PV                1
Act PV                1
VG Size               1020,00 MiB
PE Size               4,00 MiB
Total PE              255
Alloc PE / Size       0 / 0
Free  PE / Size       255 / 1020,00 MiB
VG UUID               XpnQic-sBwB-B3lZ-JYjs-oRHQ-NDF7-chp23w
```

5. Criar um Logical Volume (`LV`) utilizando metade do disco

```
[aluno@centos01 ~]$ sudo lvcreate -L 500 -n lv_part1 vg_data
Logical volume "lv_part1" created.
```

6. Criar um `LV` utilizando 10% do disco

```
[aluno@centos01 ~]$ sudo lvcreate -L 100M -n lv_part2 vg_data
Logical volume "lv_part2" created.
```

7. Verificar que os `LV`s estão criados

```
[aluno@centos01 ~]$ sudo lvs vg_data
LV       VG      Attr       LSize   Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert
lv_part1 vg_data -wi-a----- 500,00m
lv_part2 vg_data -wi-a----- 100,00m
```

```
[aluno@centos01 ~]$ sudo lvdisplay vg_data
--- Logical volume ---
LV Path                /dev/vg_data/lv_part1
LV Name                lv_part1
VG Name                vg_data
LV UUID                Hjwm5J-Q2hn-K4L3-kf9d-Uisn-34QA-gh709i
LV Write Access        read/write
LV Creation host, time centos01.homelab.local, 2021-07-01 17:33:09 -0300
LV Status              available
# open                 0
LV Size                500,00 MiB
Current LE             125
Segments               1
Allocation             inherit
Read ahead sectors     auto
- currently set to     8192
Block device           253:2

--- Logical volume ---
LV Path                /dev/vg_data/lv_part2
LV Name                lv_part2
VG Name                vg_data
LV UUID                Qr2TXt-PUZ2-ipN0-eRdx-HOVv-G6eF-FaA1Ai
LV Write Access        read/write
LV Creation host, time centos01.homelab.local, 2021-07-01 17:38:09 -0300
LV Status              available
# open                 0
LV Size                100,00 MiB
Current LE             25
Segments               1
Allocation             inherit
Read ahead sectors     auto
- currently set to     8192
Block device           253:3
```

8. Formatar os dois `LV`s como `ext4`

```
[aluno@centos01 ~]$ sudo mkfs.ext4 /dev/vg_data/lv_part1
mke2fs 1.42.9 (28-Dec-2013)
Filesystem label=
OS type: Linux
Block size=1024 (log=0)
Fragment size=1024 (log=0)
Stride=0 blocks, Stripe width=0 blocks
128016 inodes, 512000 blocks
25600 blocks (5.00%) reserved for the super user
First data block=1
Maximum filesystem blocks=34078720
63 block groups
8192 blocks per group, 8192 fragments per group
2032 inodes per group
Superblock backups stored on blocks:
8193, 24577, 40961, 57345, 73729, 204801, 221185, 401409

Allocating group tables: done
Writing inode tables: done
Creating journal (8192 blocks): done
Writing superblocks and filesystem accounting information: done
```

9. Montar os `LV`s nos diretórios criados anteriormente no `/mnt`

```
[aluno@centos01 ~]$ sudo mount /dev/vg_data/lv_part1 /mnt/dir1
[aluno@centos01 ~]$ sudo mount /dev/vg_data/lv_part2 /mnt/dir2
```

```
[aluno@centos01 ~]$ mount | grep vg_data
/dev/mapper/vg_data-lv_part1 on /mnt/dir1 type ext4 (rw,relatime,seclabel,data=ordered)
/dev/mapper/vg_data-lv_part2 on /mnt/dir2 type ext4 (rw,relatime,seclabel,data=ordered)
```

```
[aluno@centos01 ~]$ df -h /mnt/dir1 /mnt/dir2
Filesystem                    Size  Used Avail Use% Mounted on
/dev/mapper/vg_data-lv_part1  477M  2,3M  445M   1% /mnt/dir1
/dev/mapper/vg_data-lv_part2   93M  1,6M   85M   2% /mnt/dir2
```

10. Redimensionar o menor `LV` para ocupar mais 20% do disco

```
[aluno@centos01 ~]$ sudo lvresize -L +200M /dev/vg_data/lv_part2
Size of logical volume vg_data/lv_part2 changed from 100,00 MiB (25 extents) to 300,00 MiB (75 extents).
Logical volume vg_data/lv_part2 successfully resized.
```

11. Verificar:
    1. Que o `LV` foi redimensionado

```
[aluno@centos01 ~]$ sudo lvs vg_data
LV       VG      Attr       LSize   Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert
lv_part1 vg_data -wi-ao---- 500,00m
lv_part2 vg_data -wi-ao---- 300,00m
```

    2. Se houve reflexo no sistema de arquivos

```
[aluno@centos01 ~]$ df -h /mnt/dir1 /mnt/dir2
Filesystem                    Size  Used Avail Use% Mounted on
/dev/mapper/vg_data-lv_part1  477M  2,3M  445M   1% /mnt/dir1
/dev/mapper/vg_data-lv_part2   93M  1,6M   85M   2% /mnt/dir2
```

12. Redimensionar o sistema de arquivos

```
[aluno@centos01 ~]$ sudo resize2fs /dev/vg_data/lv_part2
resize2fs 1.42.9 (28-Dec-2013)
Filesystem at /dev/vg_data/lv_part2 is mounted on /mnt/dir2; on-line resizing required
old_desc_blocks = 1, new_desc_blocks = 3
The filesystem on /dev/vg_data/lv_part2 is now 307200 blocks long.
```

```
[aluno@centos01 ~]$ df -h /mnt/dir1 /mnt/dir2
Filesystem                    Size  Used Avail Use% Mounted on
/dev/mapper/vg_data-lv_part1  477M  2,3M  445M   1% /mnt/dir1
/dev/mapper/vg_data-lv_part2  287M  2,0M  270M   1% /mnt/dir2
```

----------------
[Voltar](README.md)
