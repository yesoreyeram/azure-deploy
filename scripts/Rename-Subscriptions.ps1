$subscriptions = Get-Content "arm-templates/tenant_with_management_groups.json" | ConvertFrom-Json

Write-Host ($subscriptions.parameters.subscriptions.defaultValue.Length) "Subscriptions Found";

foreach($subscription in $subscriptions.parameters.subscriptions.defaultValue){
    Write-Host $subscription.SubscriptionName $subscription.SubscriptionId ;
    az rest --method "POST" --url ("https://management.azure.com/subscriptions/"+$subscription.SubscriptionId+"/providers/Microsoft.Subscription/rename?api-version=2019-03-01-preview") --body ("{ 'SubscriptionName' : '"+$subscription.SubscriptionName+"'}")
}
