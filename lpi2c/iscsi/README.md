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

Descobre quais targets estão disponíveis no servidor:

```
sudo iscsiadm -m discovery -t sendtargets -p 192.168.18.199
```

O retorno do comando será o nome do target

```
192.168.18.199:3260,1 iqn.linuxlpi.homelab.local:lun0
```

Edite o arquivo `/etc/iscsi/initiatorname.iscsi` e coloque o nome do target e LUN que será configurado:

```
InitiatorName=iqn.linuxlpi.homelab.local:lun0
```

Para configurarmos os dados de conexão, precisaremos criar a seguinte estrutura de diretórios (importante ter as `"` para evitar problemas com os caracteres especiais):

```
sudo mkdir -p "/etc/iscsi/nodes/iqn.linuxlpi.homelab.local:lun0/192.168.18.199:3260,1"
```

Agora editamos o arquivo `/etc/iscsi/iscsid.conf` e acrescentamos os seguintes dados no final do arquivo:

```
node.session.auth.authmethod = CHAP
node.session.auth.username = aluno
node.session.auth.password = 1q2w3e4r
node.session.auth.username_in = alunosrv
node.session.auth.password_in = 1q2w3e4r
node.startup = automatic
```

Agora reiniciamos o sistema:

```
sudo reboot
```



```
sudo iscsiadm -m node -T iqn.linuxlpi.homelab.local:lun0 -p 192.168.18.199 -l
```
```
```
```
```
```
```
```
```
```
```
```

