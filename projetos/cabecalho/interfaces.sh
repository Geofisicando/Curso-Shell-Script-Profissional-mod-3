#!/bin/bash

[ -z "$1" ] && echo "Ofereça uma opção qualquer, use -h para obter ajuda" && exit 1

HELP="Mensagem de ajuda qualquer"
VERSION="Versão 1.0"
HEADER="#!/bin/bash
# 
# teste.sh (Shell Script)
# 
# Objetivo: Nosso primeiro projeto.
# 
# Site: https://dirack.github.io
# 
# Versão 1.0 
#               
# Programador: Rodolfo A C Neves (Dirack) 25/01/2021
#       
# Email: rodolfo_profissional@hotmail.com
#               
# Licença: GPL-3.0 <https://www.gnu.org/licenses/gpl-3.0.txt>.
"

case $1 in
	-h | --help) ## Exibe ajuda do programa
		echo "$HELP"
		exit 0
	;;
	-v | --version) ## Exibe a versão do programa
		echo "$VERSION"
		exit 0
	;;
	-sh) ## Gerar cabeçalho em Shell Script
		NOMEDOPROGRAMA="$2"
		[ -z "$2" ] && NOMEDOPROGRAMA="script.sh"
		echo "$HEADER" > "$NOMEDOPROGRAMA"
		exit 0
	;;
	*) ## Erro opção desconhecida
		echo "Erro: Opção $1 desconhecida!"
		exit 2
esac
