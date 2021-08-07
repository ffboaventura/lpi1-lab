---
template: index
title: Lab-09 - Configurando sessões e escrevendo scripts
sitename: LPIC-I - Laboratório 01
---

[Lista de Comandos](../comandos.md)

## Requisitos

- Crie um diretório `~/bin` onde serão armazenados os scripts

```
mkdir ~/bin
```

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

```
nano ~/.profile
```

Na última linha acrescente:


```bash
export PATH="$HOME/bin:$PATH"
```

2. Crie um script que busque o nome da distribuição atual no arquivo `/etc/os-release` e imprima na tela

```bash
#!/bin/bash

distribuicao=`grep ^NAME /etc/os-release | cut -d= -f2`

echo "A distribuição atual é: $distribuicao"

```

3. Crie um script que leia os nomes dos usuários no `/etc/passwd` e imprima os que possuem shell terminada em `sh`

```bash
#!/bin/bash

usuarios=`grep sh$ /etc/passwd | cut -d: -f1`

echo "Usuários com shell de login:"
echo $usuarios

```

4. Crie um script que some dois números inteiros solicitados ao usuário

```bash
#!/bin/bash

echo "Digite dois números: "
read N1 N2

soma=$(( N1 + N2 ))
echo "A soma de $N1 e $N2 é $soma"

```

5. Cria um script que:
    1. Defina uma função para soma de dois parâmetros
    2. Leia os números a serem somados como argumentos da linha de comando
    3. Solicite ao usuário caso os dois números não tenham sido passados como argumento


```bash
#!/bin/bash

function soma() {
  soma=$(( $N1 + $N2 ))

  echo $soma
}

if [ $# -lt 2 ]; then
  echo "Digite dois números: "
  read N1 N2
else
  N1=$1
  N2=$2
fi

soma

```


------------
[Respostas](respostas.md)
