[int]$x = 0; [int]$y = 0
[System.Collections.ArrayList]$list = @()

$direction = ((Get-Content advent03.txt).ToCharArray())

ForEach ($_ in $direction)
{
    if ($_ -eq "^")
    {
        $y++
        [string]$position = $x,$y
        $list.Add($position)
    }
    elseif ($_ -eq "<")
    {
        $x--
        [string]$position = $x,$y
        $list.Add($position)
    }
    elseif ($_ -eq ">")
    {
        $x++
        [string]$position = $x,$y
        $list.Add($position)
    }
    else
    {
        $y--
        [string]$position = $x,$y
        $list.Add($position)
    }
}

$list = $list | Sort-Object -Unique
$list.count