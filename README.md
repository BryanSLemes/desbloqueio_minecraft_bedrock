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

<img src="imgs/resultado.png" alt="Mensagem final do script" width="650">

---

## Dependência: Unlocker

Este projeto utiliza o [**Unlocker**](http://www.emptyloop.com/unlocker/) para desbloquear e apagar o arquivo `Windows.ApplicationModel.Store.dll` localizado na pasta `System32`.  
O Unlocker é uma ferramenta gratuita que permite manipular arquivos bloqueados por processos do sistema operacional.

> 🔗 [Download Unlocker Portable (MajorGeeks)](https://www.majorgeeks.com/files/details/unlocker_portable.html)  


## Informações do Script
💡 Toda a lógica do programa está implementada no arquivo desbloqueio.bat

1. Backup do Arquivo Windows.ApplicationModel.Store.dll:<br>
    O programa criará uma cópia de segurança do arquivo Windows.ApplicationModel.Store.dll antes de prosseguir.

2. Remoção do Arquivo Windows.ApplicationModel.Store.dll da pasta System32:<br>
    O programa utiliza o Unlocker para desbloquear e apagar o arquivo Windows.ApplicationModel.Store.dll localizado na pasta System32.

3. Copia do Arquivo de Desbloqueio na pasta System32:<br>
    Arquivo de Desbloqueio Windows.ApplicationModel.Store.dll presente na pasta arquivo_desbloqueio é copiado para C:\Windows\System32, concluindo o processo de desbloqueio do Minecraft.
