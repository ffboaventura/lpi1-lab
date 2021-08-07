---
template: index
title: Lab-08 - Expressões Regulares
sitename: LPIC-I - Laboratório 01
---

- [Lista de Comandos](../comandos.md)
-

## Requisitos

- Download dos arquivos
  - [calice.txt](files/calice.txt)
  - [fado.txt](files/fado.txt)
  - [pedaco.txt](files/pedaco.txt)

### Observações

- O download pode ser feito de dentro das máquinas utilizando o comando:

```
wget https://labs.fboaventura.dev/lpi1c/lab08/files/<arquivo.txt>
```

- É boa prática utilizar aspas simples (`'`) ao redor da expressão regular, para evitar expansão do shell.  Quando utilizarmos variáveis nas expressões regulares, podemos utilizar aspas duplas (`"`).
- Mantenha uma cópia dos arquivos quando for executar comandos que façam alterações

### Operadores

- `^` representa o início da linha
- `$` representa o final da linha
- `.` utilizado para indicar a presença de qualquer caractere
- `*` indica que o caractere anterior aparece em qualquer quantidade (inclusive nenhuma vez)
- `?` indica que o caractere anterior aparece zero ou uma vez
- `[]` indica uma classe de caracteres
  - [a-zA-Z0-9]

## Objetivos

1. Utilizando o arquivo `/etc/passwd` como parâmetro:
  1. Procure pelo usuário `aluno`

  ```
  grep 'aluno' /etc/passwd
  ```

  2. Procure pelos usuários que iniciem com `p`

  ```
  grep '^p' /etc/passwd
  ```

  3. Procure pelos usuários que o **segundo** caractere seja uma vogal

  ```
  grep '^.[aeiou]' /etc/passwd
  ```

  4. Procure pelos usuários que a linha termine com `h`

  ```
  grep 'h$' /etc/passwd
  ```

2. Nos arquivos baixados/criados:
  1. Identifique qual deles possui uma linha que comece com ` ` (espaço)

  ```
  grep '^ ' *.txt
  ```

  2. Em quantas linhas aparecem a palavra `filho`?

  ```
  grep 'filho' *.txt | wc -l
  ```

  3. Em quantas linhas ocorrem encontros vocálicos?

  ```
  grep '[aeiou][aeiou]' *.txt | wc -l
  ```

  ```
  grep '[aeiou]\{2,\}' *.txt | wc -l
  ```

  4. Em quantas linhas aparecem a letra `r` seguida de `c` ou `t`?

  ```
  grep 'r[ct]' *.txt | wc -l
  ```

3. No arquivo `calice.txt`:
  - substitua `amarga` por `doce`

  ```
  sed -i 's/amarga/doce/g' calice.txt
  ```

  - substitua `calada` por `amada`

  ```
  sed -i 's/calada/amada/g' calice.txt
  ```

  - substitua `labuta` por `farinha`

  ```
  sed -i 's/labuta/farinha/g' calice.txt
  ```

  - substitua `mentira` por `verdade`

  ```
  sed -i 's/mentira/verdade/g' calice.txt
  ```

  - substitua `morta` por `torta`

  ```
  sed -i 's/morta/torta/g' calice.txt
  ```

4. No arquivo `fado.txt`:

  - Substitua todas as ocorrências de letras acentuadas por suas versões sem acento

  ```
  sed -e 's/É/E/g;s/[ãáâ]/a/g;s/ú/u/g;s/ç/c/g' fado.txt
  ```

  ```
  sed -i 'y/Éãáâúç/Eaaauc/' fado.txt
  ```

  - Remova todas as letras `m` do texto

  ```
  sed -i 's/m//g' fado.txt
  ```

  - Remova as linhas onde aparecem a sequência `sto`

  ```
  sed -i '/sto/d' fado.txt
  ```

------------
[Respostas](respostas.md)
