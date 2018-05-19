[int]$x1 = 0; [int]$y1 = 0; [int]$x2 = 0; [int]$y2 = 0; [int]$p1 = 0;[int]$p2 = 1
[System.Collections.ArrayList]$list = @(); [System.Collections.ArrayList]$santa = @(); [System.Collections.ArrayList]$robo = @()
$direction = (Get-Content advent03.txt).ToCharArray()

ForEach ($_ in $direction)
{
    $santap = $direction[$p1]
    $santa.Add($santap)
    $p1 = $p1 + 2
}
ForEach ($_ in $direction)
{
    $robop = $direction[$p2]
    $robo.Add($robop)
    $p2 = $p2 + 2
}
ForEach ($_ in $santa)
{
    if ($_ -eq "^")
    {
        $y1++
        [string]$position = $x1,$y1
        $list.Add($position)
    }
    elseif ($_ -eq "<")
    {
        $x1--
        [string]$position = $x1,$y1
        $list.Add($position)
    }
    elseif ($_ -eq ">")
    {
        $x1++
        [string]$position = $x1,$y1
        $list.Add($position)
    }
    elseif ($_ -eq "v")
    {
        $y1--
        [string]$position = $x1,$y1
        $list.Add($position)
    }
}
ForEach ($_ in $robo)
{
    if ($_ -eq "^")
    {
        $y2++
        [string]$position2 = $x2,$y2
        $list.Add($position2)
    }
    elseif ($_ -eq "<")
    {
        $x2--
        [string]$position2 = $x2,$y2
        $list.Add($position2)
    }
    elseif ($_ -eq ">")
    {
        $x2++
        [string]$position2 = $x2,$y2
        $list.Add($position2)
    }
    elseif ($_ -eq "v")
    {
        $y2--
        [string]$position2 = $x2,$y2
        $list.Add($position2)
    }
}

$list = $list | Sort-Object -Unique
$list.count
