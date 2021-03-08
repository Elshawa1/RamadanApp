Connect-PnPOnline -Url "https://<<tenant>>/sites/RamadanApp" -UseWebLogin
Apply-PnPProvisioningTemplate -Path ".\RamadanSiteContent.xml"