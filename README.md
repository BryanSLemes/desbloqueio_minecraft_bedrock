# Desbloqueio Minecraft Bedrock

## Sobre o projeto
O objetivo deste script é tornar o processo de desbloqueio do Minecraft mais ágil e prático, garantindo que todas as etapas sejam executadas exatamente conforme estabelecido, a fim de evitar erros e eventuais problemas.

## Licença

[![LICENSE](https://img.shields.io/github/license/Ileriayo/markdown-badges?style=for-the-badge)](https://github.com/BryanSLemes/desbloqueio_minecraft_bedrock/blob/master/LICENSE)

<h1 id="executar-projeto">Como Executar o projeto</h1>

### Este desbloqueio só funciona em sistemas operacionais WINDOWS 10 e 11

## Clone o repositório
Baixe o projeto via Git:

```bash
git clone https://github.com/BryanSLemes/desbloqueio_minecraft_bedrock
```

Ou baixe o projeto compactado como ZIP diretamente do GitHub:

Clique no botão Code

Selecione Download ZIP

<img src="imgs/code.png" alt="Botão Code no GitHub" width="650"> 
<img src="imgs/zip.png" alt="Baixar como ZIP" width="650">

## Requisitos

1. Ter o Minecraft instalado e já ter o aberto pelo menos uma vez.

2. Ter o Microsoft Visual C++ instalado <br>
 Obs: Caso você não o tenha instalado é possível baixá-lo através da pasta .\desbloqueio_minecraft_bedrock\arquivo_desbloqueio\Requerimentos. <br>
 Execute o arquivo VC_redist.x64.exe para baixar as dependências.


## Execute o script

1. Extraia o conteúdo do projeto (caso tenha baixado o ZIP).

2. Clique com o botão direito sobre o arquivo `desbloqueio.bat` e selecione <b>Executar como administrador:</b>

```bash
desbloqueio.bat
```

<img src="imgs/adm.png" alt="Executar como administrador" width="650">
<img src="imgs/confirmar.png" alt="Confirmação do UAC" width="650">

### Caso a execução do script seja bloqueada, conforme demonstrado na imagem abaixo, siga o passo a passo indicado para prosseguir com o desbloqueio do Minecraft:

<img src="imgs/block.png" alt="Bloqueio do Windows" width="400">
<img src="imgs/permitir.png" alt="Permitir Execução Script" width="400">

## Resultado da Execução

Ao executar o script, o seguinte fluxo será seguido automaticamente:

✅ Minecraft Desbloqueado com sucesso – Tudo ocorreu corretamente.

❌ Minecraft NÃO Desbloqueado. – Leia as mensagens anteriores para entender o motivo da falha.

<img src="imgs/resultado_novo.png" alt="Mensagem final do script" width="650">

## Ao Executar o Minecraft

Será aberta uma página da Web, apenas feche-a.

<br>

## Informações do Script
💡 Toda a lógica do programa está implementada no arquivo desbloqueio.bat

1. O Programa copiará a pasta .\arquivo_desbloqueio\Juansekill para a pasta       C:\Users\usuario_atual\AppData\Roaming\Minecraft Bedrock.

2. O Programa copiará o arquivo .\arquivo_desbloqueio\Juego\vcruntime140_1.dll para a pasta C:\XboxGames\Minecraft for Windows\Content.
