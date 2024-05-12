# Provisionamento de Instâncias EC2 na AWS com Terraform

Este repositório contém arquivos Terraform para provisionar instâncias EC2 na Amazon Web Services (AWS), incluindo a criação de um grupo de segurança (Security Group) para acesso SSH e HTTP, bem como a execução de um script de instalação do Apache nas instâncias.

## Pré-requisitos

Antes de começar, é necessário ter os seguintes itens instalados e configurados:

- [Terraform](https://www.terraform.io/downloads.html)
- [AWS CLI](https://aws.amazon.com/cli/)
- Credenciais de acesso à AWS configuradas localmente (`aws configure`)
- Chave SSH para acessar as instâncias EC2

## Como Usar

1. Clone este repositório para o seu ambiente local:  git clone https://github.com/wandersonvinhal/terraform-aws-ec2.git

2. Navegue até o diretório clonado:  cd terraform-aws-ec2

3. Inicialize o diretório do Terraform para baixar os plugins necessários: terraform init

4. Personalize as configurações conforme necessário no arquivo `terraform.tfvars`. Este arquivo contém as variáveis que podem ser ajustadas, como o tipo de instância, a região da AWS. Além disso, é necessário personalizar o arquivo `providers.tf` com as suas credenciais da AWS antes de executar o Terraform. Certifique-se de adicionar suas credenciais de acesso da AWS no arquivo `providers.tf`.

5. Visualize as alterações planejadas antes de aplicá-las: terraform plan

6. Se tudo estiver correto, aplique as alterações para criar as instâncias EC2: terraform apply

7. Após a conclusão, você verá os detalhes das instâncias criadas. Você pode acessar essas instâncias usando o IP público fornecido e a chave SSH que você gerou anteriormente.

8. As instâncias serão provisionadas com um grupo de segurança que permite acesso SSH (porta 22) e HTTP (porta 80).

9. Um script de instalação do Apache será executado automaticamente nas instâncias, configurando um servidor web.

10. Para destruir as instâncias EC2 e todos os recursos associados, execute: terraform destroy

## Estrutura do Projeto

- `main.tf`: Contém a definição da infraestrutura a ser provisionada, incluindo a configuração das instâncias EC2, grupo de segurança e execução do script do Apache.
- `variables.tf`: Define as variáveis utilizadas no arquivo `main.tf`.
- `terraform.tfvars`: Arquivo de exemplo para personalização das variáveis.
- `datasources.tf`: Define as fontes de dados utilizadas no projeto. Por exemplo, para recuperar informações sobre imagens AMI disponíveis na região especificada.
- `providers.tf`: Define o provedor da AWS e a região a ser usada para provisionar os recursos.
- `install_apache.sh`: Script de instalação do Apache nas instâncias EC2.
- `outputs.tf`: Define os outputs do Terraform, que podem ser úteis para visualizar informações após a execução.
- `.gitignore`: Arquivo para especificar os arquivos e diretórios a serem ignorados pelo Git.

## Contribuição

Contribuições são bem-vindas! Sinta-se à vontade para abrir uma issue para relatar problemas ou propor melhorias.





