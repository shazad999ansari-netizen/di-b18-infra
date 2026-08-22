# ============================================================
# Terraform Remote State Bootstrap Script
# Run this ONE TIME manually before using the pipeline.
# ============================================================

$RESOURCE_GROUP  = "rg-tfstate"
$LOCATION        = "centralindia"
$STORAGE_ACCOUNT = "stchordevtfstate"   # globally unique naam chahiye — change karo agar clash ho
$CONTAINER       = "tfstate"

# Resource Group banao
az group create --name $RESOURCE_GROUP --location $LOCATION

# Storage Account banao (Standard LRS, public access off)
az storage account create `
  --name $STORAGE_ACCOUNT `
  --resource-group $RESOURCE_GROUP `
  --location $LOCATION `
  --sku Standard_LRS `
  --allow-blob-public-access false

# Blob Container banao
az storage container create `
  --name $CONTAINER `
  --account-name $STORAGE_ACCOUNT

Write-Host "✅ State storage ready! Ab terraform init run karo." -ForegroundColor Green
Write-Host "Storage Account: $STORAGE_ACCOUNT" -ForegroundColor Cyan
Write-Host "Container: $CONTAINER" -ForegroundColor Cyan
