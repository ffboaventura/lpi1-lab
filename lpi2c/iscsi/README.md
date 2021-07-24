# Configuração do iSCSI

## Ubuntu (target)

Instala o sistema tgt, que funciona como `target` (servidor) do iSCSI

```
sudo apt install tgt
```

Criar um arquivo de configuração de uma lun no iSCSI

```
sudo tgt-setup-lun -n tgt-1 -d /dev/sdb 192.168.18.200 192.168.18.199
sudo tgt-admin --dump | sudo tee /etc/tgt/conf.d/iscsi.conf
```


O comando abaixo inicializa o iscsi e os targets, colocando-os em modo de "escuta" em todos os endereços IP disponíveis no servidor

```
sudo tgtadm --lld iscsi --mode target --op bind --tid 1 --initiator-address ALL
```

O comando abaixo tem a finalidade de verificar que as configurações estão corretas e que uma (ou mais) LUN(s) está(ão) ativa(s)

```
sudo tgtadm --mode target --op show
```

## CentOS (initiator)

Instala o pacote do `iscsi-initiator`

```
sudo yum install -y iscsi-initiator-utils
```

**SE JA TIVER EXECUTADO ALGUM DOS COMANDOS ANTERIORMENTE**

```
sudo rm -rf /var/lib/iscsi/*
sudo systemctl restart iscsid
```

Descobre quais targets estão disponíveis no servidor:

```
sudo iscsiadm -m discovery -t sendtargets -p 192.168.18.199
```

O retorno do comando será o nome do target

```
192.168.18.199:3260,1 iqn.2001-04.com.ubuntu01-tgt-1
```

Edite o arquivo `/etc/iscsi/initiatorname.iscsi` e coloque o nome do target e LUN que será configurado:

```
InitiatorName=iqn.2001-04.com.ubuntu01-tgt-1
```

Agora vamos fazer o login no `target`

```
sudo iscsiadm -m node -T iqn.2001-04.com.ubuntu01-tgt-1 -p 192.168.18.199 -l
```

Para verificar que o login está funcionando:

```
sudo iscsiadm -m session
tcp: [3] 192.168.18.199:3260,1 iqn.2001-04.com.ubuntu01-tgt-1 (non-flash)
```

Verificar se o disco está disponível

```
sudo lsblk
```

```
NAME                     MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda                        8:0    0   20G  0 disk
├─sda1                     8:1    0    1G  0 part /boot
└─sda2                     8:2    0   19G  0 part
  ├─centos_centos01-root 253:0    0   17G  0 lvm  /
  └─centos_centos01-swap 253:1    0    2G  0 lvm  [SWAP]
sdb                        8:16   0    5G  0 disk
sr0                       11:0    1 58.3M  0 rom
```

```
```
```
```
```
```

