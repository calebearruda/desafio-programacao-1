# Resolução do Desafio proposto pela Nexaas
O desafio foi desenvolvido usando a linguagem Ruby v 2.3.4, foi utilizado o Rails como framework na versão 5.1.4.
Para realizar a autenticação foi utilizado a gem Devise e para o frontend foi utilizado Bootstrap v4.
Banco de dados Postgresql versão 9.3

## Instruções de configuração ambiente DEV
1. Possuir o Ruby versão 2.0+ e o Rails versão 5.0+ instalado na máquina
2. Possuir o banco de dados Postgresql versão 9.3+ instalado na máquina
3. Após realizar o download ou clone do projeto abrir o arquivo /config/database.yml e alterar as propriedades username e password. Colocar as propriedades da máquina a ser executado o programa
4. Abrir um console no caminho do diretório raiz da aplicação e executar os comandos:
```
 bundle install
```
```
 rails db:create
```
```
 rails db:migrate
```
```
 rails s
```
Acessar localhost:3000 e usar a aplicação.