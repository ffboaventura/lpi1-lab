# Lab-10 - Loops e decisões

[Lista de Comandos](../comandos.md)

## Requisitos

- Crie um diretório `~/var` e armazene o arquivo [usuarios.csv](files/usuarios.csv)

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
- `source <arquivo>` - importa as definições em um arquivo para o shell do script
    - `source /etc/os-release`
- `read <VAR1> <VAR2>...` - lê a entrada do usuário para uma ou mais variáveis.  Sem parâmetros serve como pausa
- `echo [STRING]` - Comando utilizado para imprimir uma string
- `expr` ou `$(())` - Realiza operações matemáticas com números inteiros
- `seq <início> [incremento] <último>` - Cria uma sequência de números

### Testes e Loops

```bash
if [ <teste> ]; then
    comandos
elif
    outros comandos
else
    outros comandos
fi
```

```bash
case $VAR in (x|y|z|t)
    [comandos]
esac
```

```bash
case $VAR in
    x|X) [comandos];;
    [yY]) [comandos];;
    z) [comandos];;
    T) [comandos];;
    *) [comandos];;
esac
```

```bash
for var_name in <condição>; do
    [comandos]
done
```

```bash
until [ <condição> ]; do
    [comandos]
done
```

```bash
while [ <condição> ]; do
    [comandos]
done
```

## Objetivos

1. Identifique as colunas do arquivo `usuarios.csv`

```bash
#!/bin/bash

ARQ="${HOME}/var/usuarios.csv"

CABECALHO=$(head -n 1 ${ARQ})

i=1
for col in `echo ${CABECALHO} | sed 's/,/ /g'`; do
  echo "$i $col"
  i=$(( $i + 1 ))
done

```

```bash
cat -n < <(head -n 1 ${HOME}/var/usuarios.csv | tr ',' '\n')
```

2. Liste o login e o primeiro nome de todos os usuários

```bash
#!/bin/bash

ARQ="$HOME/var/usuarios.csv"

cut -d, -f2,3,5 ${ARQ} | sed 's|,| / |g'
```

3. Conte a quantidade de usuários masculinos e femininos

```bash
#!/bin/bash

ARQ="$HOME/var/usuarios.csv"

sed -e '1d' ${ARQ} | cut -d, -f6 | sort | uniq -c

```

```bash
#!/bin/bash

ARQ="$HOME/var/usuarios.csv"

echo "Female: `grep 'Female' ${ARQ} | wc -l`"
echo "Male: $(grep 'Male' ${ARQ} | wc -l)"

```


```bash
#!/bin/bash

ARQ="$HOME/var/usuarios.csv"


f=0
m=0

while read -r line
do
  case $line in
    Female) f=$(( $f + 1 )) ;;
    Male) m=$(( $m + 1 )) ;;
  esac
done < <(cut -d, -f6 ${ARQ})

echo "Female: $f"
echo "Male  : $m"

```

4. Considerando os usuários que a primeira letra do login seja uma vogal e mostre o primeiro nome e o domínio do e-mail
<!--
```bash
#!/bin/bash

ARQ="${HOME}/var/usuarios.csv"

sed '1d' ${ARQ} | while read line; do
  ini_login=$(echo $line | cut -d, -f2 | cut -c1)
  case ${ini_login} in (a|e|i|o|u)
    nome=$(echo $line | cut -d, -f3)
    dominio=$(echo $line | cut -d, -f5 | cut -d@ -f2)
    echo "${nome} ${dominio}"
  esac
done

```


```bash
sed '1d' ${HOME}/var/usuarios.csv | cut -d, -f2,3,5 | grep "^[aeiou]" | while read line; do echo "$(echo $line | cut -d, -f2) $(echo $line | cut -d, -f3 | sed -e 's/^.*@//')"; done
```
 -->


------------
[Respostas](respostas.md)
