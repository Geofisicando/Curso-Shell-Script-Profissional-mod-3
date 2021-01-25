#!/bin/bash

DEBUG=${1:-0}

debug(){
	[ "$1" -le "$DEBUG" ] || return
	local prefixo
	local nivel
	nivel="$1"
	case "$1" in
		1) prefixo="---{ ";;
		2) prefixo="------{ ";;
		3) prefixo="---------{ ";;
		4) prefixo="------------{ ";;
		*) echo "Mensagem não categorizada: $*"; return;;
	esac

	echo "($nivel)$prefixo$*"
}

debug 1 "***Início do programa***"

read -p "Digite seu nome: " NOME

[ -z "$NOME" ] && debug 3 "Usuário não digitou um nome!"

echo "O nome digitado é $NOME"

read -p "Qual a sua idade, $NOME? " IDADE

[ -z "$IDADE" ] && debug 3 "Usuário não digitou uma idade!"

echo "Sua idade é $IDADE"

echo "contando 5 segundos..."
debug 2 "Entrando no laço..."

for i in $(seq 5)
do
	sleep 1
	debug 4 "$i"
done

debug 1 "***Fim do programa***"
