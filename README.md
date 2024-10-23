# trab-web

O Doidos BET é um site de apostas que permite aos usuários realizar apostas em competições esportivas, utilizando um sistema de odds dinâmico.

## Índice

- [Visão Geral](#visão-geral)
- [Requisitos](#requisitos)
- [Estrutura do projeto](#estrutura-do-projeto)
- [Como executar](#como-executar)
- [Referências](#referências)
- [Contribuição](#contribuição)
- [Licença](#licença)

## Visão Geral
Este site permite que o usuário se cadastre ou entre em sua conta, e, por meio de dinheiro fictício, possa fazer apostas com base nas competições disponíveis do site. O modelo das apostas foi feito para que as odds aumentem com base na probabilidade de vitória, ou seja, quanto mais pessoas votarem em um time, maiores as odds do time rival.

## Requisitos
- Conta na AWS com permissões para criação de EC2.
- Terraform 1.0.0 ou superior instalado ([instalação](https://learn.hashicorp.com/tutorials/terraform/install-cli)).
- Docker 20.10.0 ou superior instalado ([instalação](https://www.docker.com/)).

## Estrutura do Projeto
```bash
trab-web
├── Devops 
    ├── criarmaquina.tf
    ├── default.conf
    ├── dockerfile
├── site
    ├── estilos.css # Referente à página inicial
    ├── estilos2.css # Referente à página de login
    ├── paginainicial.html
    ├── paginalogin.html 
    ├── script.js # Referente à página inicial
