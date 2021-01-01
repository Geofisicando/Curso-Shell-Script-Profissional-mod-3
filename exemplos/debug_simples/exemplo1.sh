#!/bin/bash
#
# Objetivo: Exemplo de script com erro de sintaxe.
# Rodar com o comando 'bash -n exemplo1.sh'.

DEBUG="2"

echo "O valor de DEBUG É $DEBUG"

# bloco if não finalizado com fi
if [ "$DEBUG" == "1" ]
then
	echo "Debug igual a 1"
fi
