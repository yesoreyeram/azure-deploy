$subscriptions = Get-Content "arm-templates/tenant.params.json" | ConvertFrom-Json

Write-Host ($subscriptions.parameters.subscriptions.value.Length) "Subscriptions Found";

foreach($subscription in $subscriptions.parameters.subscriptions.value){
    Write-Host $subscription.SubscriptionName $subscription.SubscriptionId;
    az rest --method "POST" --url ("https://management.azure.com/subscriptions/" + $subscription.SubscriptionId +"/providers/Microsoft.Subscription/rename?api-version=2019-03-01-preview") --body ("{ 'SubscriptionName' : '"+ ( $subscription.SubscriptionName ) +"'}")
}
