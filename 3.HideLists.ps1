$listName = "QnA"
$listName2= "UserPoints"
$site = "https://<<tenant>>.sharepoint.com/sites/RamadanApp/"

Connect-PnPOnline -Url $site -UseWebLogin
Set-PnPList -Identity $listName -Hidden $true
