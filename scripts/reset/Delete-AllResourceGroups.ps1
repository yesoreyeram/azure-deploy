az extension add --name resource-graph

$resourcegroups = ( az graph query -q "resourcecontainers | where type == 'microsoft.resources/subscriptions/resourcegroups'" ) 

foreach($rg in ($resourcegroups | ConvertFrom-Json)){
    Write-Host $rg.id $rg.name $rg.subscriptionId
    ## Uncomment the following lines
    # az group delete --name $rg.name --no-wait --subscription $rg.subscriptionId # --yes
}