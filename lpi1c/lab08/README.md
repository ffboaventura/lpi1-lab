# Lab-08 - Expressões Regulares

- [Lista de Comandos](../comandos.md)
-

## Requisitos

- Download dos arquivos
  - [artigo](files/artigo.txt)
  - [calice](files/calice.txt)
  - [fado](files/fado.txt)
  - [pedaco](files/pedaco.txt)

### Observações

- É boa prática utilizar aspas simples (`'`) ao redor da expressão regular, para evitar expansão do shell.  Quando utilizarmos variáveis nas expressões regulares, podemos utilizar aspas duplas (`"`).
- Mantenha uma cópia dos arquivos quando for executar comandos que façam alterações

## Objetivos

1. Utilizando o arquivo `/etc/passwd` como parâmetro:
    1. Procure pelo usuário `aluno`
    2. Procure pelos usuários que iniciem com `p`
    3. Procure pelos usuários que o **segundo** caractere seja uma vogal
    4. Procure pelos usuários que a linha termine com `h`
2. Nos arquivos baixados/criados:
    1. Identifique qual deles possui uma linha que comece com ` ` (espaço)
    2. Em quantas linhas aparecem a palavra `filho`?
    3. Em quantas linhas ocorrem encontros vocálicos?
    4. Em quantas linhas aparecem a letra `r` seguida de `c` ou `t`?
3. No arquivo `calice.txt`:
    - substitua `amarga` por `doce`
    - substitua `calada` por `amada`
    - substitua `labuta` por `farinha`
    - substitua `mentira` por `verdade`
    - substitua `morta` por `torta`
4. No arquivo `fado.txt`:
    - Substitua todas as ocorrências de letras acentuadas por suas versões sem acento
    - Remova todas as letras `m` do texto
    - Remova as linhas onde aparecem a sequência `sto`

------------
[Respostas](respostas.md)
