# trab-web

Este e um projeto de web de um site de apostas BET feito para treinar as metodologias DevOps em um projeto para a faculdade, neste projeto decidimos usar HTML com Bootstrap, Javascript, CSS e o banco de dados MYSQL para desenvolver o site da melhor forma possivel, também usamos dockers e terraforms para que contanerizar a aplicação e hospeda-la em um T2.Micro, assim possibilitando ela ser acessada pelos colegas de turma


## Índice

- [Visão Geral](#visão-geral)


## Visão Geral
Este site permite que o usuário se cadastre ou entre em sua conta, e por meio de dinheiro ficticiol possa fazer apostas com base nas competições disponiveis do site. O modelo das apostas foi feito para que as odds aumentem com base na probabilidade de vitoria, ou seja, quanto mais gente votando em um time, maior as odds do time rival


## Requisitos
- Para que seja possivel hospedar o site na nuvem é preciso uma conta da AWS com permisões para criação de EC2
- [Terraform instalado](https://learn.hashicorp.com/tutorials/terraform/install-cli).
- [Dockers instalado](https://www.docker.com/).

## Estrutura do Projeto
```bash
trab-web
├── Devops 
    ├── criarmaquina.tf
    ├── default.conf
    ├── dockerfile
├── site
    ├── estilos.css #Referente a pagina inicial
    ├── estilos2.css #Referente a pagina de login
    ├── paginainicial.html
    ├── paginalogin.html 
    ├── script.js #Referente a pagina inicial
```

## Como executar
1. Clone este repositório:
```bash
git clone https://github.com/dadagss/trab-web.git
cd trab-webb
```

2. Inicialize o Terraform:
```bash
terraform init
```

3. Visualize o plano de execução:
```bash
terraform plan 
```

4. Aplique as mudanças para criar a infraestrutura:
```bash
terraform apply 
```

5. Após a execução, você verá o endereço IP da instância EC2. Acesse via navegador para verificar a instalação do Nginx:
```
http://<endereço_ip_da_instância>
```

6. Para destruir a infraestrutura:
```bash
terraform destroy
```