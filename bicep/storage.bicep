@description('3-24 characters, lowercase letters and numbers only, globally unique')
@minLength(3)
@maxLength(24)
param storageAccountName string

// Defaults to the resource group's own region, so you don't hard-code it
param location string = resourceGroup().location

// Only these three values are accepted; anything else fails before deploying
@allowed([
  'Standard_LRS'
  'Standard_GRS'
  'Standard_ZRS'
])
param skuName string = 'Standard_LRS'

resource storage 'Microsoft.Storage/storageAccounts@2023-05-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: skuName
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
    minimumTlsVersion: 'TLS1_2'
    allowBlobPublicAccess: false
    supportsHttpsTrafficOnly: true
  }
}

output storageId string = storage.id