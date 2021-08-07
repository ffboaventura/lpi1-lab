---
template: index
title: Lab-09 - Configurando sessões e escrevendo scripts
sitename: LPIC-I - Laboratório 01
---

[Lista de Comandos](../comandos.md)

## Requisitos

- Crie um diretório `~/bin` onde serão armazenados os scripts

## Informações úteis

### Variáveis especiais

- `$*`  - Todos os valores passados como argumentos
- `$#` - O número de argumentos
- `$0`  - O nome do arquivo de script
- `$1..$n` - O número do argumento na posição n
- `$!` - O PID do último programa executado
- `$$` - O PID do Shell atual
- `$?` - O Código numérico de saída do último comando (0 == sem erros)

### Comandos

- `cut` - corta uma linha em campos definidos (`-d[separador] -f<[inicio]-[fim]> | <c1,c2,c3>`) ou caracteres (`-c[inicio]-[fim]`)
    - `cut -d: -f1,7 /etc/passwd`
<!-- - `source <arquivo>` - importa as definições em um arquivo para o shell do script -->
- `read <VAR1> <VAR2>...` - lê a entrada do usuário para uma ou mais variáveis.  Sem parâmetros serve como pausa
- `echo [STRING]` - Comando utilizado para imprimir uma string
- `expr` ou `$(())` - Realiza operações matemáticas com números inteiros

## Objetivos

1. Acrescente o diretório `~/bin` (`$HOME/bin`) no `PATH` da sua sessão
2. Crie um script que busque o nome da distribuição atual no arquivo `/etc/os-release` e imprima na tela
3. Crie um script que leia os nomes dos usuários no `/etc/passwd` e imprima os que possuem shell terminada em `sh`
4. Crie um script que some dois números inteiros solicitados ao usuário
5. Cria um script que:
    1. Defina uma função para soma de dois parâmetros
    2. Leia os números a serem somados como argumentos da linha de comando
    3. Solicite ao usuário caso os dois números não tenham sido passados como argumento


------------
[Respostas](respostas.md)
