# estudos-terraform

Comando principais:

```bash
# Iniciar o terraform
terraform init

# Exibir as alterações que o terraform irá executar
terraform plan

# Executar as alterações
terraform apply

# Remover todas as alterações
terraform destroy

# Bonus de comando para aceitar automáticamente
terraform apply/destroy -auto-approve
```

Arquivos Principais:

```bash
main.tf
variables.tf
outputs.tf
```

Variaveis de Ambiente:

```bash
# Nome dos Arquivos:
<ambiente>.tfvars

# Exemplos:
dev.tfvars
prod.tfvars
stag.tfvars

# Executando comando e setando a variavel
terraform applu -var-file="dev.tfvars"
```

Workspaces:

```bash
# Listar workspaces
terraform workspace list

# Criar um workspace
terraform workspace new prod
terraform workspace new dev
terraform workspace new staging

# Selecionar um workspace
terraform workspace select prod

# Remove rum workspace
terraform workspace delete prod
```
