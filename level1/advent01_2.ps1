$travel = Get-Content "~/DEV/4. adventofcode/level1/advent01.txt"
$floors = $travel.ToCharArray(); $santa = 0; $position = 0

ForEach ($_  in $floors)
{
    if ($_ -eq '(')
    {
        $santa++ 
    }
    elseif ($_ -eq ')')
    {
        $santa-- 
    }
    $position++
    if ($santa -eq -1)
    {
        Write-Host "Santa has moved $position times."
        break
    }
}