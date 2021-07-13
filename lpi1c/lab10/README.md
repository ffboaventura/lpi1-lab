# Lab-10 - Loops e decisões

[Lista de Comandos](../comandos.md)

## Requisitos

- Crie um diretório `~/var` e armazene o arquivo [files/usuarios.csv](usuarios.csv)

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
2. Liste o login e o primeiro nome de todos os usuários
3. Conte a quantidade de usuários masculinos e femininos
4. Considerando os usuários que a primeira letra do login seja uma vogal e mostre o primeiro nome e o domínio do e-mail
5.

------------
[Respostas](respostas.md)
