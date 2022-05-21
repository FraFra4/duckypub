# $r1 = Invoke-WebRequest https://raw.githubusercontent.com/FraFra4/duckypub/master/cputasksTEST.ps1
# Invoke-Expression $($r1.Content)


Write-Host " "
Write-Host "Here are the top 10 CPU consuming processes right now"
Write-Host " "
Get-Process | Sort-Object CPU -Descending | Select-Object -First 10
