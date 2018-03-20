login-azurermaccount

Select-AzureRmSubscription -Subscription "Dev-Test-Lab"

$rg = get-azurermresourcegroup
foreach ($r in $rg)
{
$vm = Get-AzureRmVM -ResourceGroupName $r.ResourceGroupName -Status | Where-Object {$_.powerstate -like 'VM stopped'}
foreach ($v in $vm)
{
start-azurermvm -ResourceGroupName $r.ResourceGroupName -Name $v.name
stop-azurermvm -resourcegroupname $r.ResourceGroupName -Name $v.name -Force
}
}
