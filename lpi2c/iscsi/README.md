# Configuração do iSCSI

## Ubuntu (target)

Instala o sistema tgt, que funciona como `target` (servidor) do iSCSI

```
sudo apt install tgt
```

Criar um arquivo de configuração de uma lun no iSCSI

```
sudo vim /etc/tgt/conf.d/iscsi.conf
```

O conteúdo do arquivo deverá ser:

```
<target iqn.linuxlpi.homelab.local:lun0>
    backing-store /dev/sdb
    initiator-address 192.168.1.200
    incominguser aluno 1q2w3e4r
    outgoinguser alunosrv 1q2w3e4r
</target>
```

As linhas acima são:
1. define o nome do `target` que será utilizado e o número da LUN
2. aponta para qual disco ou partição será disponibilizado por esta LUN
3. ip da máquina que fará a conexão com o servidor (cliente)
4. nome do usuário e senha que serão utilizados para conexão pelo *cliente*
5. nome do usuário e senha que serão utilizados para conexão pelo *servidor*



Reiniciar o serviço do tgt

```
sudo systemctl restart tgt
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

Agora editamos o arquivo `/etc/iscsi/nodes/iqn.linuxlpi.homelab.local:lun0/192.168.18.199:3260,1/default` com os seguintes dados:

```
node.session.auth.authmethod = CHAP
node.session.auth.username = aluno
node.session.auth.password = 1q2w3e4r
node.session.auth.username_in = alunosrv
node.session.auth.password_in = 1q2w3e4r
node.startup = automatic
```

Agora reiniciamos o serviço do `iscsid`

```
sudo systemctl restart iscsid
```


```
```
```

