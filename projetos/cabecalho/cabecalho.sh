#!/bin/bash
# 
# cabecalho.sh (Shell Script)
# 
# Objetivo: Interface de linha de comandos para gerar um cabeçalho
# padronizado em Shell Script ou Python.
# 
# Site: https://dirack.github.io
# 
# Versão 1.0 
#               
# Programador: Rodolfo A C Neves (Dirack) 31/03/2021
#       
# Email: rodolfo_profissional@hotmail.com
#               
# Licença: GPL-3.0 <https://www.gnu.org/licenses/gpl-3.0.txt>.

[ -z "$1" ] && echo "Ofereça uma opção qualquer, use -h para obter ajuda" && exit 1

NOME_HELP="\033[00;01mNOME\033[m\n\t$(basename $0)"

DESCRICAO_HELP="\033[00;01mDESCRIÇÃO\033[m\n\tGerar o cabeçalho para um arquivo de programa de uma determinada linguagem de programação com objetivo, nome do programa, programador e etc.
"

PARAMETROS_HELP="\033[00;01mPARÂMETROS\033[m
\t-h --help Exibe essa tela de ajuda e sai
\t-v --version Exibe a versão do programa e sai
\t-sh  Cabeçalho para um programa em shell script
\t-py  Cabeçalho para um programa em python
"

EXEMPLOS_HELP="\033[00;01mEXEMPLO DE USO\033[m
\t~$ cabecalho -sh Arquivo.sh # Cabeçalho para Arquivo.sh
\t~$ cabecalho -sh Arquivo.sh -m <objetivo> # Adiciona o <objetivo> ao cabeçalho do arquivo
"

HELP="$NOME_HELP\n$DESCRICAO_HELP\n$PARAMETROS_HELP\n$EXEMPLOS_HELP\n"

VERSION="Versão 1.0"

NOMEDOPROGRAMA="$2"
TMP="/tmp/arquivo_tmp_cabecalho.txt"
[ -f "$NOMEDOPROGRAMA" ] && touch "$TMP"

[ -n "$3" ] && [ "$3" == "-m" ] && OBJETIVO="$4"

HEADER="# 
# ${NOMEDOPROGRAMA:="TEMPLATE"} (LANGUAGE)
# 
# Objetivo: ${OBJETIVO:="TODO"}.
# 
# Site: https://dirack.github.io
# 
# Versão 1.0 
#               
# Programador: Rodolfo A C Neves (Dirack) $(date +%d/%m/%Y)
#       
# Email: rodolfo_profissional@hotmail.com
#               
# Licença: GPL-3.0 <https://www.gnu.org/licenses/gpl-3.0.txt>.
"

GERAR_CABECALHO(){
	LANGUAGE="$1"
	PRIMEIRA_LINHA="$2"

	echo "$PRIMEIRA_LINHA" > $TMP
	echo "$HEADER" | sed "s/LANGUAGE/$LANGUAGE/" >> "$TMP"
	if [ -f "$NOMEDOPROGRAMA" ]
	then
		cat "$NOMEDOPROGRAMA" >> "$TMP"
		cp "$TMP" "$NOMEDOPROGRAMA"
	else
		cp "$TMP" "$NOMEDOPROGRAMA"
	fi
}


case $1 in
	-h | --help) ## Exibe ajuda do programa
		echo -e "$HELP"
		exit 0
	;;
	-v | --version) ## Exibe a versão do programa
		echo "$VERSION"
		exit 0
	;;
	-sh) ## Gerar cabeçalho em Shell Script
		LANGUAGE="Shell Script"
		PRIMEIRA_LINHA="#!/bin/bash"
		GERAR_CABECALHO "$LANGUAGE" "$PRIMEIRA_LINHA"
		exit 0
	;;
	-py) ## Gerar cabeçalho em Python
		LANGUAGE="Python"
		PRIMEIRA_LINHA="#!/usr/bin/env python"
		GERAR_CABECALHO "$LANGUAGE" "$PRIMEIRA_LINHA"
		exit 0
	;;
	*) ## Erro opção desconhecida
		echo "Erro: Opção $1 desconhecida!"
		exit 2
esac
