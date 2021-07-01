# Lab-01 - Discos, Partições e Arquivos de Sistemas

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
2. Verificar que o PV está criado
3. Criar um Volume Group (`VG`) utilizando o PV criado
4. Verificar que o VG está criado
5. Criar um Logical Volume (`LV`) utilizando metade do disco
6. Criar um `LV` utilizando 10% do disco
7. Verificar que os `LV`s estão criados
8. Formatar os dois `LV`s como `ext4`
9. Montar os `LV`s nos diretórios criados anteriormente no `/mnt`
10. Redimensionar o menor `LV` para ocupar mais 20% do disco
11. Verificar:
    1. Que o `LV` foi redimensionado
    2. Se houve reflexo no sistema de arquivos
12. Redimensionar o sistema de arquivos


