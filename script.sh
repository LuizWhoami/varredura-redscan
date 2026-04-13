#!/bin/bash

log=$(cat access.log)


echo "[1] Detectar possíveis ataques de XSS"
echo "[2] Detectar tentativas de SQL Injection"
echo "[3] Detectar varredura de diretórios"
echo "[4] Detectar possíveis ataques por scanners"
echo "[5] Identificar tentativas de acesso a arquivos sensiveis"
echo "[6] Detectar possíveis ataques de força bruta a arquivos/pastas"
echo "[7] Primeiro e último acesso de um IP suspeito"
echo "[8] Localizar user-agent utilizado por um IP suspeito"
echo "[9] Listar os IPs e verificar o número de requisições"
echo "[10] Localizar acesso a um determinado arquivo sensível"


echo "Digite um numero: "
read pergunta

if [ "$pergunta" == "1" ]; then
	echo "Ataques XSS"
	echo $(grep -E "<script>|%3Cscript" access.log)

elif [ "$pergunta" == "2" ]; then
	echo "Ataque SQL Injection"
	echo $(grep -E "union|select|insert|drop|%27|%22" access.log)

elif [ "$pergunta" == "3"]; then
	echo "Varredura de diretórios (Directory Traversal)"
	echo $(grep -E "\.\./|\.\.%2f" access.log)

elif [ "$pergunta" == "4"]; then
        echo "Detectar possíveis ataques por scanners (User-Agent suspeito)"
        echo $(grep -E "nikto|nmap|sqlmap|acunetix|curl|masscan|python" access.log)

elif [ "$pergunta" == "5"]; then
        echo "Identificar tentativas de acesso a arquivos sensíveis"
        echo $(grep -E "\.env|\.git|\.htaccess|\.bak" access.log)

elif [ "$pergunta" == "6"]; then
        echo "Detectar possíveis ataques de força bruta a arquivos/pastas"
        echo $(grep "404" access.log | cut -d " " -f1 | sort | uniq -c | sort -nr | head)

elif [ "$pergunta" == "7"]; then
        echo "Primeiro e último acesso de um IP suspeito"
        echo $(grep "IP_ACESSO" access.log | head -n 1)
	echo $(grep "IP_ACESSO" access.log | tail -n 1)

elif [ "$pergunta" == "8" ]; then
        echo "Localizar user-agent utilizado por um IP suspeito"
        echo $(grep "IP_SUSPEITO" access.log | cut -d '"' -f6 | sort | uniq)

elif [ "$pergunta" == "9" ]; then
        echo "Listar os IPs e verificar o número de requisições"
        echo $(cat access.log | cut -d " " -f1 | sort | uniq -c)

elif [ "$pergunta" == "10" ]; then
        echo "Localizar acesso a um determinado arquivo sensível"
        echo $(grep "arquivo_sensivel" access.log)

else
	echo "foi nao"
fi

