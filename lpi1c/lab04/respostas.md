# Lab-04 - Checksums

[Lista de Comandos](../comandos.md)

## Requisitos

Faça download dos arquivos:

- [lab04.tar.gz](files/lab04.tar.gz) [sha512sum](files/lab04.tar.gz.sha512) [sha256sum](files/lab04.tar.gz.sha256) [md5sum](files/lab04.tar.gz.md5)


```
wget https://labs.fboaventura.dev/lpi1c/lab04/files/lab04.tar.gz
wget https://labs.fboaventura.dev/lpi1c/lab04/files/lab04.tar.gz.sha512
wget https://labs.fboaventura.dev/lpi1c/lab04/files/lab04.tar.gz.sha256
wget https://labs.fboaventura.dev/lpi1c/lab04/files/lab04.tar.gz.md5
```

## Objetivos

### Bash

1. Verifique os checksums do arquivo:
    - md5sum

    ```
    md5sum -c lab04.tar.gz.md5
    ```

    - sha256sum

    ```
    sha256sum -c lab04.tar.gz.sha265
    ```

    - sha512sum

    ```
    sha512sum -c lab04.tar.gz.sha512
    ```

2. Descompacte o arquivo e verifique os checksums que estão no diretório:


    ```
    cd ~
    tar xzvf ./Downloads/lab04.tar.gz
    cd lab04
    ```


    1. NGINX:
      - md5sum

      ```
      md5sum -c nginx-1.21.0.tar.gz.md5
      ```

      - sha256sum

      ```
      sha256sum -c nginx-1.21.0.tar.gz.sha256
      ```

      - sha512sum

      ```
      sha512sum -c nginx-1.21.0.tar.gz.sha512
      ```

    2. passwd.md5

    ```
    md5sum -c passwd.md5
    ```

    3. dolar.py

    ```
    sha512sum -c dolar.py.sha512
    ```

    4. arquivos.sha256

    ```
    sha256sum -c arquivos.sha256
    ```

3. Faça a correção dos checksums que falharam

```
sha256sum nginx-1.21.0.tar.gz dolar.py > arquivos.sha256
cd ..
md5sum lab04.tar.gz > lab04.tar.gz.md5
```



------------
[Respostas](respostas.md)
