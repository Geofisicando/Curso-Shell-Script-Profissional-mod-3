#!/bin/bash
# 
# barra_de_progresso.sh (Shell Script)
# 
# Objetivo: Exemplo de barra de progresso para Shell Script com dialog.
# 
# Site: https://dirack.github.io
# 
# Versão 1.0 
#               
# Programador: Rodolfo A C Neves (Dirack) 21/05/2021
#       
# Email: rodolfo_profissional@hotmail.com
#               
# Licença: GPL-3.0 <https://www.gnu.org/licenses/gpl-3.0.txt>.

[ -z "$1" ] && echo "Ofereça uma opção qualquer, use -h para obter ajuda" && exit 1

NOME_HELP="\033[00;01mNOME\033[m\n\t$(basename $0)"

DESCRICAO_HELP="\033[00;01mDESCRIÇÃO\033[m\n\tGerar uma barra de progresso com o status de execução retornado por um script do shell.
"

PARAMETROS_HELP="\033[00;01mPARÂMETROS\033[m
\t-h --help Exibe essa tela de ajuda e sai
\t-v --version Exibe a versão do programa e sai
\t-r --run Rodar o script e exibir a barra de progresso
"

EXEMPLOS_HELP="\033[00;01mEXEMPLO DE USO\033[m
\t~$ $(basename $0) -r ./script.sh # Gerar barra de progresso para script.sh
\t~$ $(basename $0) --run ./script.sh  
"

HELP="$NOME_HELP\n$DESCRICAO_HELP\n$PARAMETROS_HELP\n$EXEMPLOS_HELP\n"

VERSION="Versão 1.0"

case $1 in
	-h | --help) ## Exibe ajuda do programa
		echo -e "$HELP"
		exit 0
	;;
	-v | --version) ## Exibe a versão do programa
		echo "$VERSION"
		exit 0
	;;
	-r | --run)
		SCRIPT="$2"
		MENSAGEM="Erro: forneça um script a ser executado!"
		[ -z "$SCRIPT" ] && echo "$MENSAGEM" && exit 3

		DIRNAME=$(dirname $SCRIPT)
		BASENAME=$(basename $SCRIPT)
		SCRIPT="$DIRNAME/$BASENAME"

		($SCRIPT) | dialog --title "Exemplo" --gauge "Em execução" 8 40
		exit 0
	;;
	*) ## Erro opção desconhecida
		echo "Erro: Opção $1 desconhecida!"
		exit 2
esac
