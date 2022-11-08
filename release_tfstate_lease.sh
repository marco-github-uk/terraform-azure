export RESOURCE_GROUP_NAME='terraformstate-rg'
export STORAGE_ACCOUNT_NAME='terraformstate10001'
export CONTAINER_NAME='terraform-state-files-prod'

ACCOUNT_KEY=$(az storage account keys list --resource-group $RESOURCE_GROUP_NAME --account-name $STORAGE_ACCOUNT_NAME --query '[0].value' -o tsv)
export ARM_ACCESS_KEY=$ACCOUNT_KEY

# az storage blob lease acquire \
az storage blob lease break \
  -b "terraform.tfstate" \
  -c "terraform-state-files-prod" \
  --account-name "${STORAGE_ACCOUNT_NAME}" 
  
# terraform-state-files-prod/terraform.tfstate