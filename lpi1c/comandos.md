# Lista de comandos do Linux

## Básicos

| Comando | Descrição |
|----|----------------|
| ls | lista arquivos |
| cd | navega na árvore de diretórios |
| mkdir | cria diretório |
| rm | remove arquivo |
| touch | criar um arquivo vazio |
| dmesg | ler mensagens do kernel |
| df | visualiza a utilização das partições |



## Discos e Partições

### Partições

- `sudo fdisk -l [caminho do disco]`
  Lista as partições existentes no(s) disco(s)
- `sudo fdisk <caminho do disco>`
  - Altera as partições do disco
  - Comandos do fdisk:
    - d – exclui uma partição;
    - F – lista partições não particionadas livres;
    - l – lista os tipos de partições conhecidas;
    - n – adiciona uma nova partição;
    - t – altera o tipo da partição;
    - v – verifica a tabela de partição;
    - i – mostra informação sobre uma partição;
    - w – grava a tabela no disco e sai;
    - q – sai sem salvar as alterações
    - m – lista todas as opções dos comandos.
- `sudo cfdisk <caminho do disco>`

### Sistemas de Arquivos

- `sudo mkfs.<tipo de sistema de arquivos> [parametros] <caminho da partição>`
   Cria um sistema de arquivos na partição selecionada
- `sudo mkfs.<tipo de sistema de arquivos> --help`
   Lista todos os parâmetros suportados para criação do sistema de arquivos

