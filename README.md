# 🔍 Log Analyzer - Shell Script

Script em **Bash** para análise de logs de acesso (`access.log`), focado na detecção de possíveis atividades maliciosas e comportamentos suspeitos em servidores web.

--

## 📌 Funcionalidades

O script permite analisar logs e identificar:

1. 🧠 Possíveis ataques de **XSS (Cross-Site Scripting)**
2. 💉 Tentativas de **SQL Injection**
3. 📁 **Directory Traversal** (varredura de diretórios)
4. 🤖 Acessos por **scanners automatizados**
5. 🔐 Tentativas de acesso a **arquivos sensíveis**
6. 🔁 Possíveis ataques de **força bruta**
7. 📍 Primeiro e último acesso de um IP suspeito
8. 🕵️ Identificação de **User-Agent** de um IP
9. 🌐 Contagem de requisições por IP
10. 📂 Busca por acesso a arquivos específicos

---

## ⚙️ Pré-requisitos

- Linux / WSL / MacOS
- Bash
- Arquivo `access.log` no mesmo diretório do script

---

## 🚀 Como usar

1. Dê permissão de execução:

```bash
chmod +x log_analyzer.sh

    Execute o script:

./log_analyzer.sh

    Escolha uma opção no menu:

Digite um numero:

📂 Estrutura do projeto

.
├── log_analyzer.sh
└── access.log

🧪 Exemplos de detecção
🔍 XSS

Detecta padrões como:

<script>
%3Cscript

💉 SQL Injection

Busca por palavras-chave como:

union
select
insert
drop
' "

📁 Directory Traversal

Detecta tentativas como:

../
..%2f

🤖 Scanners

Identifica ferramentas como:

    nikto

    nmap

    sqlmap

    acunetix

    curl

    masscan

    python
