# Lab-07 - Gerenciando processos

[Lista de Comandos](../comandos.md)
- [Cheat Sheets](../../cheatsheets) - Tabelas com resumos de comandos
    - [screen](../../cheatsheets/screen.md) - Utilização do screen
    - [tmux](../../cheatsheets/tmux.md) - Utilização do tmux

## Requisitos

- Instalar os pacotes screen e tmux


## Objetivos

1. Visualize a lista de processos do seu servidor
2. Quantos processos estão em execução no seu servidor?
3. Visualize a lista de processos em formato de árvore
4. Identifique se o processo do Apache está em execução
    1. CentOS: `httpd`
    2. Ubuntu: `apache2`
5. Quantos processos do apache estão em execução?
6. Qual(is) é(são) o(s) PID(s) do(s) processo(s) do apache?
7. Qual é o PID do processo de origem (pai) do apache?
8. Caso haja mais de um, escolha um dos processos e "mate"
9. Qual foi o resultado?
10. Utilizando o `tmux`, divida a tela em duas:
    1. Em uma das telas acompanhe o arquivo de log do apache
    2. Na outra tela, escolha e mate um dos processos do apache
    3. Qual foi o resultado no arquivo de log?
    4. O que acontece se todos os processos forem mortos?


------------
[Respostas](respostas.md)
