$boxes = Get-Content advent02.txt

$sarea = 0

ForEach ($_ in $boxes)
{
    $box = $_ -split 'x' | ForEach-Object { [int] $_} | Sort-Object
    $small = ([int]$box[0] + [int]$box[0] + [int]$box[1] + [int]$box[1])
    $sarea = $sarea + $small
}
   
$area = 0
ForEach ($_ in $boxes)
{
    $package = $_ -split 'x'
    $big = ([int]$package[0] * [int]$package[2] * [int]$package[1])
    $area = $area + $big
}

$total = $sarea + $area        
Write-Host "Bro, you need about $total feet of ribbon. Holy Santa Batman."