---
template: index
title: Lab-11 - Gerenciando o sistema
sitename: LPIC-I - Laboratório 01
---

[Lista de Comandos](../comandos.md)

## Requisitos

- N/A

## Objetivos

1. Altere o padrão de diretório home para as contas que serão criadas no sistema:
    1. Deve conter os diretórios: `bin`, `www`, `var` e `docs`
    2. O arquivo `.bashrc` deve conter a chamada para o comando `fortune -s`
    3. Deve conter um arquivo de boas vindas ao novo usuário
    4. E no diretório `www` deve ter um arquivo chamado `index.html` com o seguinte conteúdo:

        ```html
        <html>
            <head>
            <title>Página Pessoal</title>
            </head>
            <body>
                <h1>Oops!</h1>
                <p>A página pessoal que deveria estar aqui não chegou ainda... Volte mais tarde!</p>
            </body>
        </html>
        ```

1. Crie os grupos: `comercial`, `compras`, `administrativo` e `ti`
1. Crie os usuários abaixo com as características determinadas:
    1. login: `joao`, grupo principal: `comercial`
    1. login: `marcos`, grupo principal: `compras`
    1. login: `maria`, grupo principal: `administrativo`
    1. login: `celio`, grupo principal: `ti`
1. Acrescente os usuários aos grupos conforme determinado:
    1. login `joao` ao grupo `administrativo`
    1. login `marcos` aos grupos `administrativo` e `ti`
    1. login `maria` ao grupo `compras`
    1. login `celio` ao grupo `www-data` ou `http`
1. Cadastre senhas para todos os usuários
1. Crie uma tarefa cron para os usuários `celio` e `marcos` que grave a lista do diretório `${HOME}/www` para o arquivo `/tmp/<login>_www.log`
1. Verifique se a data do sistema está correta
1. Verifique se o relógio do sistema está configurado para atualizar automaticamente
1. Veja os logs do sistema atual
1. Acompanhe os logs do servidor Apache


------------
[Respostas](respostas.md)
