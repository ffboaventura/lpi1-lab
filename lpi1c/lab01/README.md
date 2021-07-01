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
2. Editar a tabela de partições do disco:
    1. Adicionar uma nova partição
    2. Listar e identificar no S.O. a partição criada
    3. Apagar a partição
    4. Verificar no S.O. que a partição foi removida
    5. Adicionar duas novas partições com tipo 83
    6. Verificar no S.O. que as partições foram criadas
3. Criar um sistema de arquivos em cada uma das partições criadas
4. Criar um diretório para cada uma das partições dentro do diretório `/mnt`
5. Montar cada uma das partições no respectivo diretório
6. Verificar que as partições estão montadas corretamente no S.O.
7. Gravar arquivos dentro de uma das partições
8. Remover as partições existentes

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

------------
[Respostas](respostas.md)
