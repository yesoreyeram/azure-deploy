# Azure Deploy

Templates and scripts for azure deployment

## Move all subscriptions to root

Below script moves all the defined subscriptions to the specified managment group / root management group / tenant

`az deployment tenant create --name clearmg --location eastus --template-file ./arm-templates/tenant-mg-reset.json --parameters ./arm-templates/tenant.params.json`