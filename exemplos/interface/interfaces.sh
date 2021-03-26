#!/bin/bash

[ -z "$1" ] && echo "Ofereça uma opção qualquer, use -h para obter ajuda" && exit 1

HELP="Mensagem de ajuda qualquer"
VERSION="Versão 1.0"

case $1 in
	-h | --help) ## Exibe ajuda do programa
		echo "$HELP"
		exit 0
	;;
	-v | --version) ## Exibe a versão do programa
		echo "$VERSION"
		exit 0
	;;
	*) ## Erro opção desconhecida
		echo "Erro: Opção $1 desconhecida!"
		exit 2
esac
