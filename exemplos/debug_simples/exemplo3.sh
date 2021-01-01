#!/bin/bash
#
# exemplo2.sh (Shell Script)
# 
# Objetivo: Exemplo de depuração simples com logging de erro.

funcao_erro(){
	echo "$(basename $0): $FUNCNAME: $BASH_LINENO: Dinheiro insuficiente!"
	exit 1
}

read -p "Quanto dinheiro vc tem? " DINHEIRO

if [ "$DINHEIRO" -ge "50" ]
then
	echo "O usuário poderá ir ao cinema!"
else
	funcao_erro
fi
