#!/bin/bash
#
# Script modificado com a função de debug
# Descomentar a linha abaixo para ativar modo debug
#DEBUG="1"

debug(){
	MARCADOR="---{"
	[ "$DEBUG" == "1" ] && echo -e "\033[33;1m$MARCADOR $*\033[m"
}

debug "***Início do programa***"
debug "Modo de depuração ativado DEBUG=1"

read -p "Digite seu nome: " NOME

[ -z "$NOME" ] && debug "Usuário não digitou nenhum nome!"

echo "O nome digitado é $NOME"

read -p "Qual a sua idade, $NOME? " IDADE

[ -z "$IDADE" ] && debug "Usuário não digitou nenhuma idade!"

echo "Sua idade é $IDADE"

debug "$(date)"
debug "***Fim da execução***"
