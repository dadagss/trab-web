# Desafio - VExpenses: Provisionamento de Infraestrutura na AWS com Terraform

Este repositório contém uma solução para o desafio de provisionamento de infraestrutura básica na AWS usando Terraform. O projeto configura uma VPC, sub-rede, grupo de segurança, instância EC2 e outras funcionalidades, além de automatizar a instalação do Nginx na instância.

## Índice
- [Visão Geral](#visão-geral)
- [Requisitos](#requisitos)
- [Estrutura do Projeto](#estrutura-do-projeto)
- [Variáveis](#variáveis)
- [Como Executar](#como-executar)
- [Recursos Criados](#recursos-criados)
- [Melhorias Implementadas](#melhorias-implementadas)
- [Critérios de Avaliação](#critérios-de-avaliação)
- [Referências](#referências)

## Visão Geral
Este projeto visa demonstrar o provisionamento de infraestrutura em nuvem usando Terraform, com foco em boas práticas de automação e segurança. 

A solução cria os seguintes recursos:
- VPC e Sub-rede
- Grupo de Segurança (com regras de SSH restritas)
- Par de Chaves para acesso SSH
- Instância EC2 com instalação automatizada do Nginx

## Requisitos
- Conta AWS com permissões para criação de VPCs e EC2.
- [Terraform instalado](https://learn.hashicorp.com/tutorials/terraform/install-cli).

## Estrutura do Projeto
```bash
Desafio---VExpenses/
├── main.tf          # Define os recursos da AWS (VPC, EC2, etc.)
├── variables.tf     # Define as variáveis do projeto
├── outputs.tf       # Define os outputs do projeto
├── README.md        # Documentação do projeto
```

## Variáveis
| Nome             | Descrição                             | Valor Padrão           |
|------------------|---------------------------------------|------------------------|
| `projeto`        | Nome do projeto                       | `VExpenses`            |
| `candidato`      | Nome do candidato                     | `Daniel_Guimarães_Silva`|
| `aws_region`     | A região AWS para criar os recursos   | `us-east-1`            |
| `vpc_cidr`       | CIDR block da VPC                     | `10.0.0.0/16`          |
| `subnet_cidr`    | CIDR block da Sub-rede                | `10.0.1.0/24`          |
| `instance_type`  | Tipo da instância EC2                 | `t2.micro`             |
| `admin_ip`       | IP permitido para acesso SSH          | *(Nenhum valor padrão)* |


## Como executar
1. Clone este repositório:
```bash
git clone https://github.com/seu_usuario/Desafio---VExpenses.git
cd Desafio---VExpenses
```

2. Inicialize o Terraform:
```bash
terraform init
```

3. Visualize o plano de execução:
```bash
terraform plan -var="admin_ip=SEU_IP_PUBLICO"
```

4. Aplique as mudanças para criar a infraestrutura:
```bash
terraform apply -var="admin_ip=SEU_IP_PUBLICO"
```

5. Após a execução, você verá o endereço IP da instância EC2. Acesse via navegador para verificar a instalação do Nginx:
```
http://<endereço_ip_da_instância>
```

6. Para destruir a infraestrutura:
```bash
terraform destroy
```
## Recursos Criados

- **VPC**: Configurada com o CIDR `10.0.0.0/16`.
- **Sub-rede**: Sub-rede privada com CIDR `10.0.1.0/24`.
- **Grupo de Segurança**: Permite conexões HTTP (porta 80) de qualquer IP e SSH (porta 22) apenas do `admin_ip`.
- **Instância EC2**: Tipo `t2.micro`, configurada para instalar o Nginx automaticamente via `user_data`.
- **Par de Chaves**: Gerado para acesso à instância EC2 via SSH.

## Melhorias Implementadas

- **Automação da Configuração do Nginx**: A instalação do Nginx ocorre automaticamente via `user_data`, facilitando a configuração.
- **Segurança no Acesso SSH**: Restrição do acesso SSH ao IP especificado na variável `admin_ip`, melhorando a segurança da instância.
- **Desativação do Login Root**: Adicionado script para desativar login via usuário root, aumentando a segurança.
- **Criptografia do Volume da Instância**: Configurada a criptografia do volume raiz para proteger os dados armazenados na EC2.

## Critérios de Avaliação

Esta seção demonstra como os requisitos do desafio foram atendidos:

- **Automação**: Uso de `user_data` para instalação do Nginx.
- **Segurança**: Grupo de segurança restrito e criptografia dos volumes.
- **Documentação Completa**: `README.md` organizado, com instruções claras de uso.
- **Infraestrutura como Código**: Uso de Terraform para gerenciar todos os recursos.
- **Melhorias de Segurança**: Explicação das decisões de design voltadas à segurança, como a restrição do SSH e a desativação do login root.

## Referências

- [Documentação do Terraform](https://www.terraform.io/docs)
- [AWS EC2 Documentation](https://docs.aws.amazon.com/ec2/index.html)