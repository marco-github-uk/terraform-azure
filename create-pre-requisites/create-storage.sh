#!/bin/bash

# export rgName='terraformstate-rg'
# # random = Get-Random -Minimum 10000 -Maximum 99999
# export saName='terraformstate10001'
# export containerName='terraform-state-files-prod'

# # Create Azure Resource Group
# az group create --name $rgName  --location eastus

# # Create Storage Account with public access disabled
# az storage account create --resource-group $rgName  --name $saName --sku Standard_LRS --allow-blob-public-access false

# # Create container to store configuration state file
# az storage container create  --name $containerName  --account-name $saName

# # List Storage Account access keys
# az storage account keys list  --resource-group $rgName  --account-name $saName


export RESOURCE_GROUP_NAME='terraformstate-rg'
export STORAGE_ACCOUNT_NAME='terraformstate10001'
export CONTAINER_NAME='terraform-state-files-prod'

# Create resource group
az group create --name $RESOURCE_GROUP_NAME --location eastus

# Create storage account
az storage account create --resource-group $RESOURCE_GROUP_NAME --name $STORAGE_ACCOUNT_NAME --sku Standard_LRS --encryption-services blob --allow-blob-public-access false

# Create blob container
az storage container create --name $CONTAINER_NAME --account-name $STORAGE_ACCOUNT_NAME
