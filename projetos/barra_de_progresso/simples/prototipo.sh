#!/bin/bash
#
# prototipo.sh (Shell Script)
# 
# Objetivo: Exemplo de barra de progresso simples em Shell.
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

# Rodar laço que exibe os pontos em background
while true; do echo -n .; sleep 1; done &
trap "kill $!" SIGTERM SIGKILL

# Rodar script teste.sh que demora 10 segundos para finalizar
echo "Running command $0"
./teste.sh > login.txt
echo done

# Encerrar o laço
kill $!
