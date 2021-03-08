$AdminCenterURL = "https://<<tenant>>-Admin.sharepoint.com"
$SiteURL = "https://<<tenant>>.sharepoint.com/sites/RamadanApp"
$SiteTitle = "Ramadan App"
$SiteOwner = "<<email of RamadanApp Site Owner>>"
$Template = "SITEPAGEPUBLISHING#0" #Communication Site template
$timezone = "4"




  
#Get Credentials to connect
#$Cred = Get-Credential
  
Try
{
    #Connect to Tenant Admin
     Connect-PnPOnline -URL $AdminCenterURL -UseWebLogin
      
    #Check if site exists already
    $Site = Get-PnPTenantSite | Where {$_.Url -eq $SiteURL}
  
    If ($Site -eq $null)
    {
        #sharepoint online pnp powershell to create communication site
        New-PnPTenantSite -Url $SiteURL -Owner $SiteOwner -Title $SiteTitle -Template $Template -RemoveDeletedSite -TimeZone $timezone
        write-host "Site Collection $($SiteURL) Created Successfully!" -foregroundcolor Green
    }
    else
    {
        write-host "Site $($SiteURL) exists already!" -foregroundcolor Yellow
    }
}
catch {
    write-host "Error: $($_.Exception.Message)" -foregroundcolor Red
    }
