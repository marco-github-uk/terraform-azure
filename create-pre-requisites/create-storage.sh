export rgName='terraformstate-rg'
# random = Get-Random -Minimum 10000 -Maximum 99999
export saName='terraformstate10001'
export containerName='terraform-state-files-prod'

# Create Azure Resource Group
az group create --name $rgName  --location eastus

# Create Storage Account with public access disabled
az storage account create --resource-group $rgName  --name $saName --sku Standard_LRS --allow-blob-public-access false

# Create container to store configuration state file
az storage container create  --name $containerName  --account-name $saName

# List Storage Account access keys
az storage account keys list  --resource-group $rgName  --account-name $saName
