$md5 = New-Object -TypeName System.Security.Cryptography.MD5CryptoServiceProvider
$utf8 = New-Object -TypeName System.Text.UTF8Encoding
$key = "yzbqklnj"; [int]$count = 0; [string]$keyfound = '00000'

while ($hash -notmatch $keyfound)
{
    $answer = $key + $count
    $hash = [System.BitConverter]::ToString($md5.ComputeHash($utf8.GetBytes($answer)))
    $count++
    [string]$hash = $hash[0..6] -replace ‘[-]’,''
    [string]$hash = $hash -replace '[ ]',''
}

Write-Host $answer
