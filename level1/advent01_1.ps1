$travel = Get-Content "~/DEV/4. adventofcode/level1/advent01.txt"
$floors = $travel.ToCharArray(); $santa = 0

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
}

Write-Host “Santa is on the $santa floor.”