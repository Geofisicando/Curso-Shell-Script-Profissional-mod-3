#!/bin/bash
#
# exemplo2.sh (Shell Script)
# 
# Objetivo: Exemplo de depuração simples com logging.

# Exibir nome do arquivo e linha atual
echo "$(basename $0): $LINENO: Iniciar execução..."

# LINENO armazena a linha atual executada pelo bash
# BASH_LINENO armazena a linha onde a função foi chamada
# FUNCNAME armazena o nome da função atual
funcao_logging(){
	echo "A função foi definida em $LINENO"
	echo "$FUNCNAME: $BASH_LINENO: Estou dentro da função"
}

funcao_logging
