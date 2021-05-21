#!/bin/bash
#
# teste.sh (Shell Script)
# 
# Objetivo: Retornar o status de execução da barra de progresso
# ao ser chamado em um subshell dentro de 'barra_de_progresso.sh'.
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

for i in $(seq 0 10 100)
do
	echo "$i"
	sleep 2
done
